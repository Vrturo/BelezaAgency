class SessionsController < ApplicationController

  def create
    authorized_user = User.authenticate(params[:email],params[:password])
    user = User.find_by(email: params[:email])

    if authorized_user
      redirect_to controller: "users", action: "show", id: user.id
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
