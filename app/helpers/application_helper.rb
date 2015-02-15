module ApplicationHelper

  def current_user
    p "&" * 90
    @current_user ||= User.find_by_id(session[:id]) if session[:id]
  end

end
