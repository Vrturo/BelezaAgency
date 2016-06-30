class SessionsController < ApplicationController

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      redirect_to(:action => 'users#show')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def destroy
      session[:user_id] = nil
      flash[:notice] = "You are now logged out"
      redirect_to root_url
    end
end
