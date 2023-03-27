# frozen_string_literal: true

module CharacterCommands
  extend Discordrb::Commands::CommandContainer
  extend Discordrb::EventContainer

  SERVER_ID = ENV['DISCORD_SERVER_ID'].freeze

  def self.register_application_commands(_bot); end
end
