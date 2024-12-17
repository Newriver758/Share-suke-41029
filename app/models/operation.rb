class Operation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # ActiveHashとの関連付け
  belongs_to_active_hash :day_or_night
  belongs_to_active_hash :work_content

  # ユーザーとの関連付け
  belongs_to :user

  # その他のバリデーションなど
  validates :operation_info, :date, :day_or_night_id, :work_content_id, presence: true
  validates :day_or_night_id, :work_content_id, numericality: { other_than: 0 }
end
