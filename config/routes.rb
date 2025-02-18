Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'
  get 'notices/index', to: 'notices#index'

  resources :users, only: %i[index show edit update] do
    resources :operations, only: [:index] # ユーザーごとの勤務一覧
  end

  resources :notices, only: %i[index create edit update destroy]
  resources :calendars, only: [:index]
  resources :operations do
    member do
      patch :check_in   # 出勤
      patch :check_out  # 退勤
    end
  end
end
