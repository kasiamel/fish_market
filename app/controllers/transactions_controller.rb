class TransactionsController < ApplicationController

  def settle_offer
    offer = Offer.find(params[:offer_id]) 

    if offer.status == "settled"
      redirect_to root_path 
      flash[:warning] = 'The Offer has been already settled' 
    end

    @purchase_offers = PurchaseOffer
      .where(offer_id: params[:offer_id])
      .order(price: :desc)
      .order(created_at: :asc)

    remaining_quantity = offer.quantity

    @purchase_offers.each do |purchase_offer|
      
      if remaining_quantity >= purchase_offer.quantity
        transaction = Transaction.new(
          offer_id: offer.id,
          purchase_offer_id: purchase_offer.id, 
          quantity: purchase_offer.quantity,
          price: purchase_offer.price)
        transaction.save
        remaining_quantity = remaining_quantity - purchase_offer.quantity
      elsif remaining_quantity != 0  && remaining_quantity < purchase_offer.quantity
        transaction = Transaction.new(
          offer_id: offer.id,
          purchase_offer_id: purchase_offer.id, 
          quantity: remaining_quantity,
          price: purchase_offer.price)
        transaction.save
        remaining_quantity = 0
      end

      break if remaining_quantity == 0
    end

    offer.status = "settled"
    offer.save
  end
end
