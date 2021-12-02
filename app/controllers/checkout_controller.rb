class CheckoutController < ApplicationController
  
  def new
     @cart = Cart.find(params[:cart_id])
  end
  

  
  def create
    @user = current_user
    @total = params[:total].to_d
    
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    
    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    if create_order
      flash[:success] = "Votre commande de #{current_user.cart.price} € est validée ! Vous allez recevoir un email de confirmation à #{current_user.email}"
      current_user.cart.items.clear
      current_user.cart.price_update
      redirect_to orders_path
    else
      flash[:alert] = "Il y a eu problème. Merci de nous contacter en nous fournissant le numéro : #{current_user.cart.id}"
      redirect_to cart_path
    end
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  private

  def create_order
    cart = current_user.cart
    order = Order.new
    order.user = current_user
    cart.items.each { |item| order.items << item }
    order.price = cart.price
  end
end
