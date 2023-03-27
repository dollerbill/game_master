# frozen_string_literal: true

module GameCommands
  extend Discordrb::Commands::CommandContainer
  extend Discordrb::EventContainer

  SERVER_ID = ENV['DISCORD_SERVER_ID'].freeze

  def self.register_application_commands(bot)
    bot.register_application_command(:list_games, 'List available campaigns', server_id: SERVER_ID)
    bot.register_application_command(:start_game, 'Start a new adventure', server_id: SERVER_ID)
    bot.register_application_command(:join_game, 'Join a game', server_id: SERVER_ID) do |cmd|
      cmd.string(:game_code, 'Game code', required: true)
    end
  end

  application_command(:list_games) do |event|
    games = Campaign.all.map { |c| "**#{c.info['name']}:**\n#{c.info['description']}\n" }.join("\n")
    event.respond(content: games)
  end

  application_command(:start_game) do |event|
    if Game.where(created_by_user_id: event.user.id).where(created_at: (30.minutes.ago..)).any?
      event.respond(content: 'User has an in-progress game')
    else
      campaigns = Campaign.limit(5)
      event.respond(content: 'Start a new game') do |_, view|
        view.row do |r|
          r.select_menu(custom_id: 'game_select', placeholder: 'Pick a game', max_values: 1) do |s|
            campaigns.each_with_index do |campaign, i|
              s.option(label: campaign.info['name'], value: i + 1)
              # s.option(label: campaigns[1].info['name'], value: 2) if campaigns[1]
              # s.option(label: campaigns[2].info['name'], value: 3) if campaigns[2]
              # s.option(label: campaigns[3].info['name'], value: 4) if campaigns[3]
              # s.option(label: campaigns[4].info['name'], value: 5) if campaigns[4]
            end
          end
        end
      end

      # event.send_message(content: 'Start the adventure when all players have joined')
      event.send_message do |_, view|
        view.row do |row|
          row.button(label: 'Start the adventure when all players have joined', custom_id: 'begin_game', style: 2)
          # row.button(label: 'Begin adventure', custom_id: 'begin_game', style: 2)
        end
      end
    end
  end

  application_command(:join_game) do |event|
    game_code = event.options['game_code']
    game = Game.find_by(code: game_code)
    event.respond("No game found with code #{game_code}") unless game

    event.respond(content: "**Joining game #{game_code}, please create your character:**") do |_, view|
      view.row do |row|
        row.button(label: 'Use Default Stats', custom_id: "default_stats:#{game_code}", style: 2)
        row.button(label: 'Input Custom Stats', custom_id: "custom_stats:#{game_code}", style: 1)
      end
    end
  end

  button(custom_id: /^custom_stats:/) do |event|
    _, game_code = event.custom_id.split(':')
    game = Game.find_by(code: game_code)
    char = Character.with_defaults(user_id: event.user.id)
    game.progress['players'][event.user.id] = char

    event.respond(content: "Created #{char[:name]} with default stats.")
  end

  button(custom_id: /^default_stats:/) do |event|
    _, game_code = event.custom_id.split(':')
    game = Game.find_by(code: game_code)
    char = Character.with_defaults(user_id: event.user.id)
    game.progress['players'][event.user.id] = char
    game.save

    event.respond(content: "Created #{char[:name]} with default stats.")
  end

  button(custom_id: 'begin_game') do |event|
    game = Game.where('progress::text like ?', "%#{event.user.id}%").last
    campaign = Campaign.find(game.campaign_id)
    name = campaign.info['name']
    chapter = campaign.info['chapters'][0]
    event.respond(
      content: "**#{name}.**\n\n_Chapter #{chapter['chapter']} - #{chapter['title']}_\n\n#{chapter['storyPrompt']}"
    )

    event.send_message(content: 'What would you like to do?') do |_, view|
      chapter['options'].each do |option|
        view.row do |row|
          row.button(label: option['description'], custom_id: "option:#{option['id']}", style: 2)
        end
      end
    end
  end

  select_menu(custom_id: 'game_select') do |event|
    campaign = Campaign.find(event.values[0])
    game = Game.create(campaign_id: campaign.id, progress: { 'players' => {} }, created_by_user_id: event.user.id)
    event.respond(content: "Starting new game: #{campaign.info['name']}\nJoin with `/join_game #{game.code}`")
  end
end
