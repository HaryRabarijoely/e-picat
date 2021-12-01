class OrderController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    cart = current_user.cart
    @order = Order.new(
      user_id: current_user.id,
      customer_stripe_id: "je sais pas",
      price: (@total*100).to_i,
    )
    puts "*" * 80
    puts @order
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
