class RemoveCommentIdFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :comment_id, :integer
  end
end
