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
    params.require(:user).permit(:username, :password, :)
  end

  def create_icons_array
    @icons_url = []
    @icons_url.append(['Choose an avatar', 'nousericon.png'])
    @icons_url.append(['Anonymous', 'nousericon.png'])
    @icons_url.append(['Business man anonymous', 'businessman.png'])
    @icons_url.append(['Business man young', 'businessyoungman.png'])
    @icons_url.append(['Business man', 'businessmanface.png'])
    @icons_url.append(['Father', 'father.png'])
    @icons_url.append(['Girl', 'girl.png'])
    @icons_url.append(['Man', 'man.png'])
    @icons_url.append(['Ninja', 'ninja.png'])
    @icons_url.append(['Red head woman', 'redheadwoman.png'])
    @icons_url.append(['Woman', 'woman.png'])
  end

end
