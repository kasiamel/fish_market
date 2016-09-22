class AddIndexesToTransactions < ActiveRecord::Migration
  def change
    add_index :transactions, :offer_id
    add_index :transactions, :purchase_offer_id
  end
end
