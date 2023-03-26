class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
