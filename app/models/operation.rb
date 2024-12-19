class Operation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # ActiveHashとの関連付け
  belongs_to_active_hash :day_or_night
  belongs_to_active_hash :work_content

  # ユーザーとの関連付け
  belongs_to :user

  # その他のバリデーションなど
  validates :operation_info,  :start_date, :end_date, presence: true
  validates :day_or_night_id, :work_content_id, numericality: { other_than: 0, message: 'を選択してください' }
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    return unless start_date.present? && end_date.present? && start_date > end_date

    errors.add(:start_date, 'は終了日より前の日付にしてください')
  end
end
