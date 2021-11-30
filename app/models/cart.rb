class Cart < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :items

  def price_update
    total = 0
    self.items.each { |item| total += item.price }
    self.update(price: total)
  end
end
