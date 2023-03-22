class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :message, presence: true
end
