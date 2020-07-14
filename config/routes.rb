Rails.application.routes.draw do
  resources :organisations
  resources :menus
  resources :options
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
end
