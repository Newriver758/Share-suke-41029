Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'

  resources :users, only: %i[edit update]
  resources :calendars, only: [:index]
  resources :operations
end
