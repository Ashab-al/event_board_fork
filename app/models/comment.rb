class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true

  validates :article, :body, presence: true
  validates :user_name, presence: true, unless: Proc.new { user.present? }

  def user_name
    if user.present?
      user.name 
    else
      super
    end
  end
end
