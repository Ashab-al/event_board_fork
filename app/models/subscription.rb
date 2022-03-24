class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: Proc.new { user.present? }
  validates :user_email, presence: true, format: { with: Devise.email_regexp }, unless: Proc.new { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: Proc.new { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: Proc.new { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end
end
