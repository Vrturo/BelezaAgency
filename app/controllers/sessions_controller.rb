class SessionsController < ApplicationController
  layout "application"
  protect_from_forgery

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

       if @user.email && @user.password == params[:password]
          session[:user_id] = @user.id
          p 'session is #{session[:user_id]}'
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
