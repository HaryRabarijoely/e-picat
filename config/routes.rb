Rails.application.routes.draw do
  root 'items#index' 
  resources :items,:path => "/NFT_cat", only: [:index, :show]
  resources :carts,:path => "/cart", only: [:create, :update, :destroy, :show]
  resources :order,:path => "/order_history",  only: [:create, :index]
  devise_for :users,:path => "/profile"
end
