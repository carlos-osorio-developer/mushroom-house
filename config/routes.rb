Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "articles#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
