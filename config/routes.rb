Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products
  resources :purchase, only: [:new, :create, :show]
end
