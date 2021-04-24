class ScoreboardsController < ApplicationController
  def index
    @users = User.joins(:activities).group(:user_id).order('sum(activities.amount) DESC')
  end
end
