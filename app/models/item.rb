class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { in: 5..500}
  validates :price, presence: true
  #validates_format_of :image_url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  has_many :orders
  has_many :users, through: :orders

end
