class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  # Returns the currently logged in user or nil if there is not one
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:id])
  end
  # make current_user available in templates as a helper
  helper_method :current_user

  # filter method to enforce a login requirement
  # apply as a before_filter on any controller you want to protect
  def authenticate
    logged_in? ? true : access_denied
  end

  # predicate method to test for logged in user
  def logged_in?
    current_user.is_a? User
  end
  # make logged_in? available in templates as a helper
  helper_method :logged_in?

  def access_denied
    redirect_to login_path, :notice => 'Please login to continue'
    return false
  end
end
