class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @room = Room.find(params[:room_id])
    @chats = @room.chats.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_chats_path(@room)
    else
      @chats = @room.chats.includes(:user)
      render :index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :image).merge(user_id: current_user.id)
  end
end
