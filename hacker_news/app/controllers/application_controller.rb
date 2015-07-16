class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def require_logged_in
  redirect('/') unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:user_id]
  end

end