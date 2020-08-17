Rails.application.routes.draw do
  get 'products/index'
  root "products#index"
  devise_for :users
end
