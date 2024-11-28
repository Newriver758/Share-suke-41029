Rails.application.routes.draw do
  get 'operations/index'
  get 'calendars/index'

  devise_for :users
  root to: "calendars#index"

  resources :users, only: [:edit, :update]
  resources :calendars, only: [:index]
  resources :operations, only: [:index]
end
