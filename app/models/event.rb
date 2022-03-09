class Event < ApplicationRecord
  validates :title, :address, :datetime, presence: true

  validates :title, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 } 
end
