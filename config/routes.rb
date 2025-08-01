Rails.application.routes.draw do
  resources :movie_genres
  resources :genres
  resources :users
  root "movies#index"

  resources :movies do
    resources :reviews
    resources :favorites
  end

  resource :session, only: [ :new, :create, :destroy ]

  get "signup" => "users#new"
end
