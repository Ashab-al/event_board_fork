class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :articles, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }
  validates :about, length: { maximum: 500 }
end
