module UsersHelper
  def icon_url_for_user
    @user.icon.nil? ? 'users-avatars/nousericon.png' : "users-avatars/#{@user.icon}"
  end
end
