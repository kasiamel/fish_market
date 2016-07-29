class AddTimetableIdAndIndexToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :timetable_id, :integer
    add_index :offers, :timetable_id
  end
end
