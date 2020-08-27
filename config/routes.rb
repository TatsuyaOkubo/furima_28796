Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:index, :new, :create]
  resources :phurchase, only: [:new, :create]
end
