class SessionsController < ApplicationController

  def new
  end

  def create
    # checks if user exists and if password is correct
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # creates a cookie
      session[:user_id] = @user.id
      redirect_to '/', :notice => "Welcome back!"
    else
      flash[:notice] = "Iincorrect username/password combination!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    update_cart({})
    redirect_to '/login'
  end

end