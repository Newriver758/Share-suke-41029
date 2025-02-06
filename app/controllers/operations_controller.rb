class OperationsController < ApplicationController
  before_action :set_user, only: [:index] # indexアクションで@userをセット
  before_action :set_operation, only: %i[show edit update destroy]
  def new
    @operation = Operation.new
    @operation.start_date ||= Date.today # デフォルト値を今日の日付に設定
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to calendars_path(start_date: @operation.start_date.beginning_of_week), notice: '運行情報が投稿されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if params[:user_id] # `/users/:user_id/operations` の場合
      @user = User.find_by(id: params[:user_id])
      @operations = @user&.operations&.order(start_date: :desc) || []
    else
      @operations = Operation.includes(:user).order(:start_date)
    end

    @operation = @operations.first || Operation.new(start_date: Date.today)
  end

  def show
  end

  def edit
  end

  def update
    if @operation.update(operation_params)
      redirect_to @operation, notice: '運行情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @operation.destroy
    redirect_to calendars_path(start_date: @operation.start_date.beginning_of_week), notice: '運行情報を削除しました。'
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id]) if params[:user_id].present?
  end

  def operation_params
    params.require(:operation).permit(:operation_info, :start_date, :end_date, :day_or_night_id, :work_content_id,
                                      :user_id, :memo)
  end
end
