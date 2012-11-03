class SessionsController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :callback]

  def new
  end

  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Signed out!"
  end
end
