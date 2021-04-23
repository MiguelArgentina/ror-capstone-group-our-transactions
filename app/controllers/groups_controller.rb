class GroupsController < ApplicationController
  def index
    @groups = Group.all.ordered_by_name
  end

  def new
    @group = Group.new
    @icons_url = create_icons_array
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = session[:user_id]
    if @group.save
      redirect_to @group
    else
      flash[:danger] = 'Invalid group details'
      redirect_to new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @activities = @group.activities.all.ordered_by_date
  end

  # GET /group/1/edit
  def edit
    @group = Group.find(params[:id])
    @icons_url = create_icons_array
  end

  # PATCH/PUT /products/1
  def update
    group = Group.find(params[:id])
    respond_to do |format|
      if group.update(group_params)
        format.html { redirect_to group, notice: 'Group details were successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  def destroy
    group = Group.find(params[:id])
    group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully deleted from database.' }
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def create_icons_array
    @icons_url = []
    @icons_url.append(['Choose an avatar', 'noicon.png'])
    @icons_url.append(%w[Anonymous noicon.png])
    @icons_url.append(['Basket ball', 'basketball-ball.png'])
    @icons_url.append(%w[Cycling bicycle.png])
    @icons_url.append(%w[Weightlifting dumbbell.png])
    @icons_url.append(%w[Skating figure-skating.png])
    @icons_url.append(%w[Fitness fitness.png])
    @icons_url.append(%w[Jogging jogging.png])
    @icons_url.append(['Martial arts', 'kimono.png'])
    @icons_url.append(['Home workout', 'lunges.png'])
    @icons_url.append(['Individual sports', 'sport.png'])
    @icons_url.append(['Team sports', 'sports.png'])
    @icons_url.append(%w[Stretching stretching.png])
    @icons_url.append(%w[Swimming swimmer.png])
    @icons_url.append(%w[Treadmill treadmill.png])
    @icons_url.append(%w[Cardio triangle.png])
    @icons_url.append(%w[Yoga yoga.png])
  end
end
