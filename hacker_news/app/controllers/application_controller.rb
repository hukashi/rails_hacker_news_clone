class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
# If you use a before_action you have access to the @current_user variable everywhere
  # before_action :current_user
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end
  # Re-write it like this for clarity/cleanness
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  def require_logged_in
    # indentation
  redirect_to root_path unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:user_id]
  end

end
