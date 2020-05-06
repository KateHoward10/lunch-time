Rails.application.routes.draw do
  resources :organisations
  root 'home#index'
end
