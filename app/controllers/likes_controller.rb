class LikesController < ApplicationController
  before_action :set_room

  def create
    like = current_user.likes.build(room_id: params[:room_id])
    like.save
    @room.create_notification_like(current_user)
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(room_id: params[:room_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
