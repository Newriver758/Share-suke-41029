class OperationsController < ApplicationController
  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to operations_path, notice: '運行情報を投稿しました。'
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
