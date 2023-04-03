class EventsController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @events = current_user.events
    @event = Event.new
    @rooms = current_user.rooms.includes(:events)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :index
    end
  end

  private
  def event_params
    params.require(:event).permit(:content, :start_time, :room_id).merge(user_id: current_user.id)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
