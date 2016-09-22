class PurchaseOffersController < ApplicationController
  before_action :current_user, :authorize

  def index
    @purchase_offers = current_user.purchase_offers.includes(:offer)
  end

  def new
    @purchase_offer = PurchaseOffer.new
    @offer = Offer.includes(:fish).find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @purchase_offer = @offer.purchase_offers.new(purchase_offer_params)
    @purchase_offer.user_id = current_user.id

    if @purchase_offer.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def purchase_offer_params
    params.require(:purchase_offer).permit(:quantity, :price)
  end
end
