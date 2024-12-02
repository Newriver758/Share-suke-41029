# app/models/work_content.rb
require 'active_hash'

class WorkContent < ActiveHash::Base
  # データ定義
  self.data = [
    { id: 1, name: '運行' },
    { id: 2, name: '代行' },
    { id: 3, name: '覚え' },
    { id: 4, name: '指導' }
  ]
end
