class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid signup details'
      render :new
    end
  end

  def show
    redirect_to root_path unless session[:user_id]
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
