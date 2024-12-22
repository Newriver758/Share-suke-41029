class CalendarsController < ApplicationController
  def index
    # パラメータから開始日を取得し、デフォルトは今週の月曜日
    @start_date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today.beginning_of_week

    # 開始日から6日後を終了日に設定
    @end_date = @start_date + 6.days
    @users = User.includes(:operations).all

    # 指定された期間内の運行情報を取得
    @operations = Operation.where('start_date <= ? AND end_date >= ?', @end_date, @start_date).includes(:user)
  end
end
