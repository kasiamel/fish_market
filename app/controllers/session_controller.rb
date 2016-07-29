class SessionController < ApplicationController
  def new
 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Thank You! See You soon!"
    redirect_to root_path
  end

  def failure
    
  end
end
