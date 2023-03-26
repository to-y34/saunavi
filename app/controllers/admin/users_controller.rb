class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "プロフィールを編集しました"
    redirect_to admin_user_path(@user)
  end  
  
  private
  def user_params
    params.require(:user).permit(:nickname, :age, :sex, :introduction, :is_deleted, :profile_image)
  end  
end
