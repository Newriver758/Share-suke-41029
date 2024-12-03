class WorkContent < ActiveHash::Base
  self.data = [
    { id: 1, name: '運行' },
    { id: 2, name: '代行' },
    { id: 3, name: '覚え' },
    { id: 4, name: '指導' }
  ]

  include ActiveHash::Associations
  has_many :operations
end
