class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def cancel
  end
end
