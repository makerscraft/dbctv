module SessionsHelper

  def current_user
    @current_user ||= User.find_by_id(sessions[:id]) if session[:id]
  end

end
