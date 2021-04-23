class ScoreboardsController < ApplicationController
  def index
    @users = User.joins(:activities).group(:author_id).order("sum(activities.amount) DESC")

  end
end
