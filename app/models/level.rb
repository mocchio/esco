class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1' },
    { id: 3, name: '2' },
    { id: 4, name: '3' },
  ]

  include ActiveHash::Associations
  has_many :rooms
end