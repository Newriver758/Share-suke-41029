class NoticesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notice = Notice.new
    @notices = Notice.includes(:user).order(created_at: :desc)
  end

  def create
    @notice = current_user.notices.build(notice_params)
    if @notice.save
      redirect_to notices_path, notice: '投稿しました'
    else
      redirect_to notices_path, alert: '投稿に失敗しました'
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:content)
  end
end
