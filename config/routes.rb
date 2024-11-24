Rails.application.routes.draw do
  get 'calendars/index'
  devise_for :users
  root to: "calendars#index"
  resources :users, only: [:edit, :update]
end
