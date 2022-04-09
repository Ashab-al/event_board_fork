class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  
  validates :event, presence: true

  validates :user_name, presence: true, unless: Proc.new { user.present? }
  validates :user_email, presence: true, format: { with: Devise.email_regexp }, unless: Proc.new { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: Proc.new { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: Proc.new { user.present? }

  validate :user_email_present, unless: Proc.new { user.present? }
  validate :user_own_event
  validate :event_time_is_up

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

  private

    def user_own_event
      if user&.events&.include?(event)
        errors.add(:user, I18n.t("activerecord.models.errors.user_own_event"))
      end
    end

    def user_email_present
      if User.where(email: user_email.downcase).present?
        errors.add(:user_email, I18n.t("activerecord.models.errors.email_already_exist"))
      end
    end

    def event_time_is_up
      if event.datetime < DateTime.now
        errors.add(:user_email, I18n.t("activerecord.models.errors.event_time_is_up"))
      end
    end
end
