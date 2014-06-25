class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  include UsersHelper
  helper_method :current_user



private

	def current_user
		p "trying to set current_user"
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	  p @current_user
	end


end
