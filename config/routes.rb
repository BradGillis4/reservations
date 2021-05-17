Rails.application.routes.draw do
  root 'sessions#welcome'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/reviews/newest_reviews' => 'reviews#newest_reviews'
  get '/restaurants/popular_restaurants' => 'restaurants#popular_restaurants'

  get '/auth/:provider/callback' => 'sessions#omniauth'  
  
  resources :reviews
  resources :reservations
  #parent route to reviews
  #nested resource - url inside url (like in the restaurant reviews index it has second like to make new review)
  resources :restaurants do
    resources :reviews, only: [:new, :create, :index ]
  end
  resources :users do 
    resources :reviews, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
