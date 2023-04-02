class EventsController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_parameter)
    if @event.save
      redirect_to events_path
    else
      render :index
    end
  end

  private
  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
