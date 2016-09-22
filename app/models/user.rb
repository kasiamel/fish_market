class User < ActiveRecord::Base
  before_save :default_values 

  validates :email, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 255 }

  has_many :purchase_offers

  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def default_values
    self.status ||= "user"
  end
end
