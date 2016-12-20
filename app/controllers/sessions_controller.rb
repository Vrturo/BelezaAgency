class SessionsController < ApplicationController
  layout "users"
  protect_from_forgery

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if !@user
        @user = User.find_by(email: params[:email].downcase)
    end
    if @user.email.downcase == params[:email].downcase && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect_to @user
    else

        flash.now.alert = "Invalid Email or Password"
        render "new"
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/'
  end
end
