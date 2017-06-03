class UsersController < ApplicationController
  # 本人以外はeditアクションとupdateアクションを実行できないようにする
  before_action :correct_user, only: [:edit, :update]

  def edit
  end

  def update
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
