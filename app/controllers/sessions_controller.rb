class SessionsController < ApplicationController
  layout "application"

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

       if @user.email && @user.password == params[:password]
          session[:user_id] = @user.id

          redirect_to @user
        else
          flash[:notice] = "Invalid Username or Password"
          flash[:color]= "invalid"
          redirect_to "/login", alert: "Invalid Username or Password"
       end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
end
