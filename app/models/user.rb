class User < ApplicationRecord
  has_many :events
  has_many :articles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }
  validates :about, length: { maximum: 500 }
end
