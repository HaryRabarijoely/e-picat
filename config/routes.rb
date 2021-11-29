Rails.application.routes.draw do
  root 'items#index' 
  resources :items,:path => "/NFT_cat", only: [:index, :show]
  resources :carts,:path => "/cart", only: [:create, :update, :destroy, :show]
  resources :orders,:path => "/order_history",  only: [:create, :show]
  devise_for :users,:path => "/profile"
end
