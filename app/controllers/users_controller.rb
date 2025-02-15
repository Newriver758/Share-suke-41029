class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @operation = @user.operations.order(start_date: :asc).first # 最も早い運行データを取得
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
