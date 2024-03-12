module LoadEvent
  extend ActiveSupport::Concern

  included do 
    before_action :set_event, except: [:index, :new, :create]
  
  end

  private
  
  def set_event
    @event = Event.find(params[:id] || params[:event_id])
  end
end