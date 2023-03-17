class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end  
    

  def close
    @user = current_user
    @user.update(is_closed: true)
    sign_out
    redirect_to root_path
  end

  
  def cancel
    @user = current_user
  end  
  
  private
  def user_params
    params.require(:user).permit(:nickname, :age, :sex, :introduction, :profile_image)
  end  
end
