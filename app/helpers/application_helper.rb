module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  def navbar_links
    if logged_in?
      render 'layouts/logged_in_user_links'
    else
      render 'layouts/logged_out_user_links'
    end
  end

end
