Rails.application.routes.draw do
  root 'items#index' 
  resources :items,:path => "/NFT_cat"
  resources :carts,:path => "/cart", only: [:create, :update, :destroy, :show]
  resources :orders,:path => "/order_history"
  devise_for :users,:path => "/profile"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  
  namespace :admin do
    root to: 'static_pages#index'
    resources :users
    resources :items
    resources :orders, only: [:index, :show]
  end

end
