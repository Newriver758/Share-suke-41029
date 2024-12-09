class OperationsController < ApplicationController
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
    @operation = Operation.find(params[:id])
  end

  private

  def operation_params
    params.require(:operation).permit(:operation_info, :day_or_night_id, :work_content_id, :date, :user_id)
  end
end
