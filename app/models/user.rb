class User < ApplicationRecord
  has_many :operations
  has_many :notices, dependent: :destroy

  has_one :attendance

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
