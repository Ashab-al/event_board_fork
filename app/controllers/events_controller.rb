class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]  
  before_action :set_event, except: [:index, :new, :create]
  before_action :password_guard!, only: [:show]

  def index
    @events = Event.all
  end

  def show
    @user = @event.user
    @new_subscription = @event.subscriptions.build(params[:subscription]) 
  end

  def new
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new, notice: I18n.t('controllers.events.error')
    end
  end
  
  def update
    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy

    redirect_to events_url, notice: I18n.t('controllers.events.destroyed')
  end

  private

    def password_guard! 
      return true if @event.pincode.blank?
      return true if signed_in? && current_user == @event.user

      if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
        cookies.permanent["events_#{@event.id}_pincode"] = params["pincode"]
      end

      unless @event.pincode_valid?(cookies.permanent["events_#{@event.id}_pincode"])
        flash.now[:alert] = I18n.t('controllers.events.wrong_pincode') if params[:pincode].present?
        render 'pincode_form'
      end
    end

    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:title, :description, :address, :datetime, :image, :pincode)
    end
end
