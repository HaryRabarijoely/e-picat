class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { in: 5..500}
  validates :price, presence: true

  
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders

  has_many :users, through: :orders
  has_one_attached :picture

end
