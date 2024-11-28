class User < ApplicationRecord
  has_many :operations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

end
