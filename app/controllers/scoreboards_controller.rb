class ScoreboardsController < ApplicationController
  def index
    @users = User.joins(:activities).group(:id).order('sum(activities.amount) DESC')
  end
end
