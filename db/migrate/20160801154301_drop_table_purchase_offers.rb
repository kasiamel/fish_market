class DropTablePurchaseOffers < ActiveRecord::Migration
  def change
    drop_table :table_purchase_offers
  end
end
