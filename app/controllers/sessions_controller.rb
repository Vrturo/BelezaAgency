class SessionsController < ApplicationController

  def create
    # authorized_user = User.authenticate(params[:email],params[:password])
    @user = User.find_by(email: params[:email])

    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to controller: "users", action: "show", id: @user.id
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to "/"
    end
end