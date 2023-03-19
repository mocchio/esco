class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level

  validates :name, :habit, :rule, presence: true
  validates :level_id, numericality: { other_than: 1, message: "can't be blank"} 
end
