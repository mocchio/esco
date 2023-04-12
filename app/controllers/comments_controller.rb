class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @room = Room.find(params[:room_id])
    @room.create_notification_comment(current_user)
    redirect_to room_path(params[:room_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
