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
  validate :validate_date_overlap, on: :create

  # カテゴリ名を返すメソッド
  def category_name
    case work_content.name
    when '運行'
      'unko'
    when '代行'
      'daiko'
    when '覚え'
      'obo'
    when '指導'
      'shido'
    else
      'default'
    end
  end

  private

  def start_date_before_end_date
    return unless start_date.present? && end_date.present? && start_date > end_date

    errors.add(:start_date, 'は終了日より前の日付にしてください')
  end

  def validate_date_overlap
    return unless start_date.present? && end_date.present?

    overlapping_operations = Operation.where(user_id: user_id)
                                      .where.not(id: id) # 自身は除外
                                      .where('start_date <= ? AND end_date >= ?', end_date, start_date)

    return unless overlapping_operations.exists?

    errors.add(:base, '同一ユーザー内で日付が重複しています')
  end
end
