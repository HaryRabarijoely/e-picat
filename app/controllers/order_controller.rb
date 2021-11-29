class OrderController < ApplicationController
  def create
  end

  def index
    @orders = Order.all
  end
end
