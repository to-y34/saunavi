class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end  
    

  def cancel
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :age, :sex, :introduction)
  end  
end
