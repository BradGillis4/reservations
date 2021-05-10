Rails.application.routes.draw do
  root 'sessions#welcome'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/reviews/newest_reviews' => 'reviews#newest_reviews'

  get '/auth/:provider/callback', to: 'sessions#omniauth'  
  
  resources :reviews
  resources :reservations
  resources :restaurants do
    resources :reviews, only: [:new, :create, :index, ]
  end
  resources :users do 
    resources :reviews, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
