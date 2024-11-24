Rails.application.routes.draw do
  get 'calendars/index'
  root to: 'calendars#index'
end
