Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'
  get 'notices/index', to: 'notices#index'

  resources :users, only: %i[index show edit update] do
    resources :operations, only: [:index] # ユーザーごとの勤務一覧
  end

  resources :notices, only: %i[index create]
  resources :calendars, only: [:index]
  resources :operations
end
