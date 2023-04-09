class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :is_matching_login_user, only: [:edit, :update,]
  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "プロフィールを編集しました"
     redirect_to user_path(@user.id)
    else
     render :edit
    end  
  end  
    

  def close
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの削除はできません。'
    else
      @user = current_user
      @user.update(is_deleted: true)
      sign_out
      redirect_to root_path
    end  
  end

  
  def withdraw
    @user = current_user
  end  
  
  private
  def user_params
    params.require(:user).permit(:nickname, :age, :sex, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
end
