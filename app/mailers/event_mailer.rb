class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name  = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "New subscription on #{event.title}"
  end
end
