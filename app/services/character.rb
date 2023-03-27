# frozen_string_literal: true

class Character
  attr_reader :atts

  def initialize(atts)
    @atts = atts
  end

  def self.with_custom_stats(atts)
    new(atts).with_custom_stats
  end

  def with_custom_stats
    {
      name: stats[:name],
      strength: stats[:strength],
      dexterity: stats[:dexterity],
      constitution: stats[:constitution],
      intelligence: stats[:intelligence],
      wisdom: stats[:wisdom],
      charisma: stats[:charisma]
    }
  end

  def self.with_defaults(atts)
    new(atts).with_defaults
  end

  def with_defaults
    {
      name: Faker::Games::DnD.name,
      player_id: atts[:user_id],
      strength: default_stats[0],
      dexterity: default_stats[1],
      constitution: default_stats[2],
      intelligence: default_stats[3],
      wisdom: default_stats[4],
      charisma: default_stats[5]
    }
  end

  private

  def default_stats
    stats = [*1..18].sample(6) until (stats || []).inject(:+) == 75
    stats
  end
end
