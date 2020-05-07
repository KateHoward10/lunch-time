Rails.application.routes.draw do
  resources :organisations
  resources :menus
  resources :options
  root 'home#index'
end
