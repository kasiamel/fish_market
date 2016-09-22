Rails.application.routes.draw do
  
  root 'misc#index'

  get '/register', to: 'users#new' 
  get '/login', to: 'session#new'
  get '/settle_offer/:offer_id', to: 'transactions#settle_offer', as: 'settle_offer'

  post '/login', to: 'session#create'

  delete '/logout', to: 'session#destroy'


  resources :users
  resources :fish, only: [:show]
  resources :purchase_offers, only: [:index, :show, :edit, :update, :destroy]
  resources :offers do
    resources :purchase_offers, only: [:new, :create]
  end

end
