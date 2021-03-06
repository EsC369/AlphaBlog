class SessionsController < ApplicationController

  def new

  end

  def create 
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:success] = "You have successfully logged in!"
          redirect_to "/users/#{user[:id]}/show"
      else
          flash.now[:danger] = "Your username and/or password was incorrect!"
          render 'new'
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:success] = "You have logged out!"
      redirect_to root_path
  end

end
