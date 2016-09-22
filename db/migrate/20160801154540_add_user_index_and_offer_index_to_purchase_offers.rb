class AddUserIndexAndOfferIndexToPurchaseOffers < ActiveRecord::Migration
  def change
    add_index :purchase_offers, :user_id
    add_index :purchase_offers, :offer_id
  end
end
