# app/models/day_or_night.rb
require 'active_hash'

class DayOrNight < ActiveHash::Base
  # データ定義
  self.data = [
    { id: 1, name: '昼' },
    { id: 2, name: '夜' }
  ]
end
