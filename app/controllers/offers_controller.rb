class OffersController < ApplicationController
  before_action :verify_admin

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
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

  def offer_params
    params.require(:offer)
    .permit(:min_price, :quantity, :fish_id, :timetable_id)
  end
end
