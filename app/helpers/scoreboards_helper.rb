module ScoreboardsHelper
  def users_image_url(user)
    user.icon.nil? ? 'users-avatars/nousericon.png' : "users-avatars/#{user.icon}"
  end
end
