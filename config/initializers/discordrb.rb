# frozen_string_literal: true

Dir[Rails.root.join('app/bot/commands/*')].each { |file| require_relative file }

GAME_MODULES = [CharacterCommands, GameCommands].freeze

bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_TOKEN'],
  client_id: ENV['DISCORD_CLIENT_ID'],
  intents: %i[server_messages direct_messages],
  prefix: '/'
)

bot.ready do
  puts 'Bot is ready!'
end

bot.message do |event|
  puts "Received message: #{event.message.content}"
end

GAME_MODULES.each do |mod|
  mod.register_application_commands(bot)
  bot.include! mod
end

bot.run :async
