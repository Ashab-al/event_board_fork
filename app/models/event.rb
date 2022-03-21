class Event < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  validates :title, :user, :address, :datetime, presence: true
  
  validates :title, length: { maximum: 255 }
  validates :description, length: { minimum: 50, maximum: 500 } 
end
