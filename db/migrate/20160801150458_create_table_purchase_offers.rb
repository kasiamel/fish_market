class CreateTablePurchaseOffers < ActiveRecord::Migration
  def change
    create_table :table_purchase_offers do |t|
      t.integer :price
      t.integer :quantity
      t.integer :user_id
      t.integer :offer_id

      t.timestamps null: false
    end
  end
end
