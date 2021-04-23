class UsersController < ApplicationController
  def new
    @user = User.new
    @icons_url = create_icons_array
  end

  def edit
    @user = User.find(params[:id])
    @icons_url = create_icons_array
  end

  def create
    @icons_url = create_icons_array
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid signup details'
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    @icons_url = create_icons_array
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        puts 'true in the if'
        format.html { redirect_to user_path(@user), notice: 'User details were successfully updated.' }
      else
        flash.now[:danger] = 'Invalid signup details'
        format.html { render :'users/edit', status: :unprocessable_entity }
      end
    end
  end

  def show
    redirect_to root_path unless session[:user_id]
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :icon)
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
