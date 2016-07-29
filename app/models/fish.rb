class Fish < ActiveRecord::Base
  validates :name, presence: true

  has_many :offers
end
