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
    @group = Group.find(params[:id])
  end

  # GET /group/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # PATCH/PUT /products/1
  def update
    group = Group.find(params[:id])
    respond_to do |format|
      if group.update(group_params)
        format.html { redirect_to group, notice: 'Product details were successfully updated.' }
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
end
