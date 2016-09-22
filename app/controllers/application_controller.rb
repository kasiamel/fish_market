class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize
    if !current_user
      redirect_to root_path 
      flash[:warning] = 'To see this page, please log in' 
    end
  end

  def verify_admin
    if current_user.status != 'admin'
      redirect_to root_path 
      flash[:warning] = 'Sorry, You Do Not Have Access' 
    end
  end
end
