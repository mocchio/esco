class Request < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :permission
end
