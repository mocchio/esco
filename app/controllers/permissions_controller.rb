class PermissionsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    request = Request.find(params[:request_id])
    permission = current_user.permissions.new(room_id: params[:room_id], request_id: request.id )
    permission.save
    
    @room.create_notification_permission(current_user, request)
    redirect_to root_path
  end
end
