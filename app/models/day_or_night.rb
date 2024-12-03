class DayOrNight < ActiveHash::Base
  self.data = [
    { id: 1, name: '昼' },
    { id: 2, name: '夜' }
  ]

  include ActiveHash::Associations
  has_many :operations
end
