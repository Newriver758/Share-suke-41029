class OperationsController < ApplicationController
  def index
    # すべての運行情報を取得
    @operations = Operation.all
  end

  def new
    @operation = Operation.new
    @users = User.all # 全ユーザーを取得
    @user = User.find_by(id: params[:user_id]) # リンクやカレンダーからユーザーを指定された場合
    @date = params[:date] # リンクやカレンダーから日付を指定された場合
  end

  def create
    @operation = Operation.new(operation_params)
    @operation = Operation.new(operation_params.merge(user_id: current_user.id)) # ログインしているユーザーを関連付け

    if @operation.save
      redirect_to calendars_path, notice: '運行情報を投稿しました'
    else
      redirect_to calendars_path, alert: '運行情報の投稿に失敗しました'
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:date, :operation_info, :day_or_night_id, :work_content_id)
  end
end
