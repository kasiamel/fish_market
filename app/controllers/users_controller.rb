class UsersController < ApplicationController
  before_action :current_user
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the Car Renting App!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
