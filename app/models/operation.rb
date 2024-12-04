class Operation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  # ActiveHashとの関連付け
  belongs_to_active_hash :day_or_night
  belongs_to_active_hash :work_content

  # その他のバリデーションなど
  validates :operation_info, :date, :day_or_night_id, :work_content_id, presence: true
end
