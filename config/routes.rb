Rails.application.routes.draw do
  
  root 'sessions#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/create_event', to: 'events#new'

  resources :users
  resources :sessions
  resources :events
  resources :invites
end