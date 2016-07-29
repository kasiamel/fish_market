class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :min_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
