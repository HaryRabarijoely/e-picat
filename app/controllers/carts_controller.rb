class CartsController < ApplicationController
  def create
  end

  # Add an element in the current_user's cart
  def update
    cart = Cart.find_by(user: current_user)
    item = Item.find(params[:id])
    cart.items << item
    cart.save
    cart.price_update
    redirect_to cart_path
  end

  # Remove an element in the current_user's cart
  def destroy
    cart = Cart.find_by(user: current_user)
    item = Item.find(params[:id])
    cart.items.delete(item)
    cart.price_update
    redirect_to cart_path
  end

  def show
    @cart = Cart.find_by(user: current_user)
  end
end
