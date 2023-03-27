# frozen_string_literal: true

class Game
  def initialize(attributes = nil)
    super
  end

  def add_item_to_inventory(item)
    inventory.add(item)
  end

  def use_item(item)
    inventory.use(item)
  end
end
