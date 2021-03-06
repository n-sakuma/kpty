class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  helper_method :current_user


  private

  def require_login
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
