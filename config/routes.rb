Rails.application.routes.draw do
  root 'items#index' 
  resources :items, only: [:index, :show]
  resources :carts, only: [:create, :update, :destroy, :show], path: 'mon_panier'
  resources :orders, only: [:create, :show]
  devise_for :users, path: 'mon_profil'
end
