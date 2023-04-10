class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :reply_comments, dependent: :destroy

  validates :text, presence: true
end
