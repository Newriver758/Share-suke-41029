class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      # 運行情報
      t.string :operation_info, null: false

      # 昼/夜（アクティブハッシュ用ID）
      t.integer :day_or_night_id, null: false

      # 業務内容（アクティブハッシュ用ID）
      t.integer :work_content_id, null: false

      # 日付範囲
      t.date :start_date, null: false
      t.date :end_date, null: false

      # ユーザーID
      t.references :user, null: false, foreign_key: true

      # メモ
      t.text :memo

      # 時間
      t.integer :start_time_id
      t.integer :end_time_id

      t.timestamps
    end
  end
end
