class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = session[:user_id]
    if @group.save
      redirect_to @group
    else
      flash.now[:danger] = 'Invalid group details'
      render :new
    end
  end

  def show
    @group = Group.find(params[:group_id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
