class OperationsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to calendars_path(start_date: @operation.date.beginning_of_week), notice: '運行情報が投稿されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @operations = Operation.includes(:user).order(:date)
  end

  def show
  end

  def edit
  end

  def update
    if @operation.update(operation_params)
      redirect_to @operation, notice: '運行情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @operation.destroy
    redirect_to calendars_path(start_date: @operation.date.beginning_of_week), notice: '運行情報を削除しました。'
  end

  private

  def set_item
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:operation_info, :day_or_night_id, :work_content_id, :date, :user_id)
  end
end
