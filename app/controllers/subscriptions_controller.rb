class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      EventMailer.subscription(@event, @new_subscription).deliver_now
      redirect_to @event, notice: I18n.t('controllers.subscriptions.created')
    else
      redirect_to 'events/show', notice: I18n.t('controllers.subscriptions.error')
    end
  end

  def destroy
    authorize @subscription
    @subscription.destroy

    redirect_to @event, notice: I18n.t('controllers.subscriptions.destroyed')
  end

  private
    def set_subscription
      @subscription = @event.subscriptions.find_by(user_id: current_user.id)
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def subscription_params
      params.fetch(:subscription, {}).permit(:user_email, :user_name)
    end
end
