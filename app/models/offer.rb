class Offer < ActiveRecord::Base
  validates :min_price, :quantity, :fish_id, :timetable_id, presence: true

  belongs_to :timetable 
  belongs_to :fish
end
