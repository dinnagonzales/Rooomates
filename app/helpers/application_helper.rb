module ApplicationHelper

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def authenticate_user
    if !current_user
      redirect_to new_sessions_path
    end
  end

end


