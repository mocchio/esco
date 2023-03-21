class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms = Room.includes(:users, :creator).order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params.merge(creator: current_user))
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy()
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:name, :level_id, :habit, :rule, user_ids: [])
  end
end
