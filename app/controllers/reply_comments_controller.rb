class ReplyCommentsController < ApplicationController
  def index
    @reply_comment = ReplyComment.new
    @comment = Comment.find(params[:comment_id])
    @room = Room.find(params[:room_id])
    @reply_comments = @comment.reply_comments.order("created_at desc")
  end

  def create
    ReplyComment.create(reply_comment_params)
    @room = Room.find(params[:room_id])
    comment = Comment.find(params[:comment_id])
    @room.create_notification_reply_comment(current_user, comment)
    redirect_to room_comment_reply_comments_path(room_id: params[:room_id], comment_id: params[:comment_id])
  end

  private
  def reply_comment_params
    params.require(:reply_comment).permit(:reply_text).merge(user_id: current_user.id, room_id: params[:room_id], comment_id: params[:comment_id])
  end
end
