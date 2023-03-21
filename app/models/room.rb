class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level

  validates :name, :habit, :rule, presence: true
  validates :level_id, numericality: { other_than: 1, message: "can't be blank"} 

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :chats

  belongs_to :creator, class_name: "User"
end
