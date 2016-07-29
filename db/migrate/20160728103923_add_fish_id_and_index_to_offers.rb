class AddFishIdAndIndexToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :fish_id, :integer
    add_index :offers, :fish_id
  end
end
