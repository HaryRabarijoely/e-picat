class CartsController < ApplicationController
  def create
  end

  # Add an element in the current_user's cart
  def update
    cart = Cart.find_by(user: current_user)
    item = Item.find(params[:id])
    cart.items << item
    if cart.save
      cart.price_update
      flash[:success] = "Le produit a bien été ajouté à votre panier"
      redirect_to cart_path
    else
      flash[:warning] = "Il y a eu un problème lors de l'ajout du produit au panier"
      redirect_to root_path
    end
  end

  # Remove an element in the current_user's cart
  def destroy
    cart = Cart.find_by(user: current_user)
    item = Item.find(params[:id])
    if cart.items.delete(item)
      cart.price_update
      flash[:success] = "Le produit a bien été supprimé de votre panier"
      redirect_to cart_path
    else
      flash[:warning] = "Il y a eu un problème lors de la suppression du produit"
      redirect_to root_path
    end
  end

  def show
    @cart = Cart.find_by(user: current_user)
  end
end
