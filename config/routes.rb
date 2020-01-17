Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index,:show]
  resources :items
  root to: 'items#index'
end
