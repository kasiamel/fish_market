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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You changed your password!"
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
