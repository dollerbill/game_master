class Game < ApplicationRecord
  after_create :create_code

  private

  def create_code
    self.code = SecureRandom.hex(3).upcase
    save
  end
end
