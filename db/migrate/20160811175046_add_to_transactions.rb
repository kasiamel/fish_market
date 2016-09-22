class AddToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :offer_id, :integer
    add_column :transactions, :purchase_offer_id, :integer
    add_column :transactions, :quantity, :integer
    add_column :transactions, :price, :integer
  end
end
