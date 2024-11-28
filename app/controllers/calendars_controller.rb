class CalendarsController < ApplicationController
  def index
    # 表示する期間を取得（例: 今週の月曜日から日曜日まで）
    @start_date = Date.today.beginning_of_week  # 週の始まり (月曜日)
    @end_date = Date.today.end_of_week          # 週の終わり (日曜日)

    @users = User.all # 全ユーザーを取得
  end
end
