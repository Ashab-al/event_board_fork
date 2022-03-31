class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 35 }
  validates :about, length: { maximum: 500 }
end
