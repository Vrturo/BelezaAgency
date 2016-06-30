class SessionsController < ApplicationController
  def destroy
      session[:user_id] = nil
      flash[:notice] = "You are now logged out"
      redirect_to root_url
    end
end
