class ReplyComment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :comment

  validates :reply_text, presence: true
end
