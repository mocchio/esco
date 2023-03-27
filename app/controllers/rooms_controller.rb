class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

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
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  def move
    room = Room.find(params[:id])
    if room.users.include?(current_user)
      redirect_to room_chats_path(room)
    else
      room.users << current_user
      redirect_to room_chats_path(room), notice: 'ルームに入室しました！'
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :level_id, :habit, :rule, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
