class Offer < ActiveRecord::Base
  before_save :default_values 

  validates :min_price, :quantity, :fish_id, :timetable_id, presence: true

  belongs_to :timetable 
  belongs_to :fish

  has_many :purchase_offers
  has_many :transactions

  def default_values
    self.status ||= "pending"
  end
end
