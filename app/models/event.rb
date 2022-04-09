class Event < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user 
  has_one_attached :image

  validates :title, :user, :address, :datetime, presence: true
  
  validates :title, length: { maximum: 255 }
  validates :description, length: { minimum: 50, maximum: 500 } 

  def pincode_valid?(pin2check)
    pincode == pin2check
  end
end
