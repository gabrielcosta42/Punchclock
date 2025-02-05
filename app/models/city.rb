class City < ApplicationRecord
  belongs_to :state
  has_and_belongs_to_many :regional_holidays

  scope :collection, -> { joins(:state).includes(:state).order('states.name ASC, cities.name ASC') }

  validates :name, presence: :true

  def to_s
    name
  end

  def holidays
    regional_holidays.to_formatted_hash
  end
end
