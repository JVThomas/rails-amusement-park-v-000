Rails.application.routes.draw do
  resources :users
  get '/users/new', to: 'users#new', as: :signup
  get '/signin', to: 'sessions#new', as: :signin
  post '/sessions/create', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions, only:[:create]
  resources :attractions
  post '/rides/new', to: 'rides#new', as: :rides
  root 'welcome#home'
end