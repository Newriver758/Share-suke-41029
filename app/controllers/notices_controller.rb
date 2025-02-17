class NoticesController < ApplicationController
  before_action :set_notice, only: %i[edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]
  def index
    @notice = Notice.new
    @notices = Notice.includes(:user).order(created_at: :desc)
  end

  def create
    @notice = current_user.notices.build(notice_params)
    if @notice.save
      redirect_to notices_path, notice: '投稿しました'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @notice.update(notice_params)
      redirect_to notices_path, notice: '投稿を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notice.destroy
    redirect_to notices_path, notice: '投稿を削除しました'
  end

  private

  def set_notice
    @notice = Notice.find(params[:id])
  end

  def authorize_user
    redirect_to notices_path, alert: '権限がありません' unless @notice.user == current_user
  end

  def notice_params
    params.require(:notice).permit(:content)
  end
end
