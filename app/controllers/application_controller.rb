class ApplicationController < ActionController::Base
  # @bot.command(:create_game, description: 'Begins a new game',
  #              usage: '+create_game game_id') do |e, game_id|
  #   # Rake::Task['db:reset'].reenable
  #   # Rake::Task['db:reset'].invoke
  #
  #   e << 'You enter a dark and gloomy forrest...'
  # end
  #
  # @bot.command(:list_games, description: 'List available games', usage: '+list_games') do |e|
  #   games = Campaign.all.map do |campaign|
  #     "game_id: #{campaign.id}, \n#{campaign.info['name']}\n#{campaign.info['description']}"
  #   end
  #   e << games
  # end
end
