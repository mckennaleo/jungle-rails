class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!
   
    @user.save

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created"
      redirect_to '/'
    else
      flash[:notice] = "Account creation failed. This email is already registered"
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end