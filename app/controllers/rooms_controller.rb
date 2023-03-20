class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:users, :creator).order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :level_id, :habit, :rule, user_ids: []).merge(creator: current_user)
  end
end
