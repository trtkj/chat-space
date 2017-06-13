class UsersController < ApplicationController
  # 本人以外はeditアクションとupdateアクションを実行できないようにする
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.where('name LIKE(?)', "%#{params[:content]}%")
    respond_to do |format|
      format.json
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to :root unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
