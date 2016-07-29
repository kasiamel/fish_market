Rails.application.routes.draw do
  
  root 'misc#index'
  get '/register', to: 'users#new' 
  get '/login', to: 'session#new'
  delete '/logout', to: 'session#destroy'

  resources :users
  resources :offers
  resources :fish, only: [:show]
  resources :session, only: [ :create]

end
