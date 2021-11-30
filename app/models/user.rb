class User < ApplicationRecord
  before_create :user_cart_creation
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :items, through: :orders
  has_many :items, through: :cart
  
  private

  # Assign a new cart for each new user
  def user_cart_creation
    self.cart = Cart.create
  end
end
