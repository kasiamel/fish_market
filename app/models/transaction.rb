class Transaction < ActiveRecord::Base
  validates :offer_id, :purchase_offer_id, :quantity, :price, presence: true

  belongs_to :offer
  belongs_to :purchase_offer
end
