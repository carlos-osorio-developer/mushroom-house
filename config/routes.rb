Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "categories#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/votes/:article_id', to: 'votes#create', as: 'create_vote'
  get '/search', to: 'articles#search', as: 'search_page'
  get '/search_results', to: 'articles#search_results', as: 'search_results'
end
