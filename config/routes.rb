Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    resources :purchases, only: [:index, :create]
  end
  resources :receivers, only: [:create]
end
