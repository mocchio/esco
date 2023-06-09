class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level

  validates :name, :habit, :rule, presence: true
  validates :level_id, numericality: { other_than: 1, message: "can't be blank"} 

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :chats, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :creator, class_name: "User"
  has_many :notifications, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :permissions, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reply_comments, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def create_notification_like(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_user.id, creator_id, id, 'like'])

    if temp.blank?
      notification = current_user.active_notifications.new(
        room_id: id,
        visited_id: creator_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_request(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_user.id, creator_id, id, 'request'])

    if temp.blank?
      notification = current_user.active_notifications.new(
        room_id: id,
        visited_id: creator_id,
        action: 'request'
      )
      notification.save if notification.valid?
    end
  end

  def create_notification_permission(current_user, request)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_user.id, request.user_id, id, 'permission'])

    if temp.blank?
      notification = current_user.active_notifications.new(
        room_id: id,
        visited_id: request.user_id,
        action: 'permission'
      )
      notification.save if notification.valid?
    end
  end

  def create_notification_join(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_user.id, creator_id, id, 'join'])

    if temp.blank?
      notification = current_user.active_notifications.new(
        room_id: id,
        visited_id: creator_id,
        action: 'join'
      )
      notification.save if notification.valid?
    end
  end

  def create_notification_comment(current_user)
    notification = current_user.active_notifications.new(
      room_id: id,
      visited_id: creator_id,
      action: 'comment'
    )
    notification.save if notification.valid?
  end

  def create_notification_reply_comment(current_user, comment, room)
    if current_user == comment.user
      notification = current_user.active_notifications.new(
        room_id: id,
        comment_id: comment.id,
        visited_id: room.creator.id,
        action: 'reply_comment'
      )
    else
      notification = current_user.active_notifications.new(
        room_id: id,
        comment_id: comment.id,
        visited_id: comment.user.id,
        action: 'reply_comment'
      )
    end
    notification.save if notification.valid?
  end

  def self.search(search)
    if search != ""
      Room.where('name LIKE ?', "%#{search}%").order(created_at: :desc)
    else
      Room.all.order(created_at: :desc)
    end
  end
end
