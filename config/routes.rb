Rails.application.routes.draw do
  resources :organisations
  resources :users
  resources :menus
  resources :options
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get 'logout', to: 'sessions#destroy'
end
