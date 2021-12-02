Rails.application.routes.draw do
  get 'static_pages/Contact'
  get 'static_pages/Terms'
  root 'items#index' 
  resources :items,:path => "/Catalogue_chat"
  resources :carts,:path => "/Mon_Panier", only: [:create, :update, :destroy, :show]
  resources :orders,:path => "/Mes_commandes"
  devise_for :users,:path => "/Mon_Profil"

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
