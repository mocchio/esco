class RequestsController < ApplicationController
  def create
    @room = Room.find(params[:room_id]) 
    request = current_user.requests.new(room_id: params[:room_id])
    request.save
    @room.create_notification_request(current_user)
    redirect_to root_path
  end
end
