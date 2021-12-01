class Order < ApplicationRecord
  # after_create :order_confirm_user
  # after_create :order_confirm_admin
  belongs_to :user
  has_and_belongs_to_many :items

  private
  
  def price_update
    total = 0
    self.items.each { |item| total += item.price }
    self.update(price: total)
  end

  def order_confirm_user
    UserMailer.user_order(self).deliver_now
  end

  def order_confirm_admin
    UserMailer.admin_checkorder(self).deliver_now
  end

end
