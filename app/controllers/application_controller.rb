class ApplicationController < ActionController::Base
  protect_from_forgery


helper_method :current_user

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]

  # If th DB is cleared but a user exists in the client there will be an error.
  rescue ActiveRecord::RecordNotFound

end

end
