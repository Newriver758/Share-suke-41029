Rails.application.routes.draw do
  get 'operations/index'

  devise_for :users
  root to: "operations#index"
  resources :users, only: [:edit, :update]
  resources :operations, only: [:index]
end
