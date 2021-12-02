module ApplicationHelper

  def average_cart_amount
    total_amount = 0
    Order.all.each { |order| total_amount += order.price }
    total_amount / (Order.count.nonzero? || 1).round(2)
  end

  def total_amount
    total_amount = 0
    Order.all.each { |order| total_amount += order.price }
    total_amount.round(2)
  end
  
end
