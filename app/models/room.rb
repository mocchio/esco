class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level

  validates :name, :habit, :rule, presence: true
  validates :level_id, numericality: { other_than: 1, message: "can't be blank"} 

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :chats, dependent: :destroy
  has_many :likes
  belongs_to :creator, class_name: "User"
  has_many :notifications, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
