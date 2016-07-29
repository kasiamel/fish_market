class MiscController < ApplicationController
  before_action :current_user

  def index
    @offers = Offer.includes(:fish, :timetable).all
    @fish = Fish.all
  end
end
