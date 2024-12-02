class Operation < ApplicationRecord
  belongs_to :user

  # ActiveHashとの関連付け
  belongs_to :day_or_night
  belongs_to :work_content

  # その他のバリデーションなど
  validates :operation_info, presence: true
end
