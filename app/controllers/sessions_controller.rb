class SessionsController < ApplicationController
  before_action :session_state, except: [:destroy]

  def create
    @user = User.find_by(username: params[:username])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Welcome to Group our transactions!'
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'Invalid signup details'
      render 'sessions/login'
    end
  end

  def destroy
    log_out
    flash[:danger] = 'User logged out'
    redirect_to root_path
  end

  private

  def session_state
    if logged_in?
      #flash[:warning] = 'You are already signed in'
      redirect_to current_user
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
