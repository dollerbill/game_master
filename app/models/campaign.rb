class Campaign < ApplicationRecord
  delegate :dig, to: :info_obj

  private

  def info_obj
    info.with_indifferent_access
  end
end
