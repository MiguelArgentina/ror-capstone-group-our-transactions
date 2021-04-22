class ActivitiesController < ApplicationController


  def index
    @activities = if params[:ungrouped]
                    User.find(session[:user_id]).activities.all.where(group_id: nil)
                  else
                    User.find(session[:user_id]).activities.all
                  end
  end

  def new
    @activity = Activity.new
    @groups = Group.all.ordered_by_name
    @groups_array = create_groups_array
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.author_id = session[:user_id]
    if @activity.save
      redirect_to @activity
    else
      flash[:danger] = 'Invalid activity details'
      redirect_to new_activity_path
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  # GET /activity/1/edit
  def edit
    @activity = Activity.find(params[:id])
    @groups = Group.all.ordered_by_name
    @groups_array = create_groups_array
  end

  # PATCH/PUT /activities/1
  def update
    activity = Activity.find(params[:id])
    respond_to do |format|
      if activity.update(activity_params)
        format.html { redirect_to activity, notice: 'Activity details were successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully deleted from database.' }
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :amount, :group_id)
  end

  def create_groups_array
    arr = Group.all.pluck( :name, :id)
    arr.insert(0, ['No group', nil])
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
