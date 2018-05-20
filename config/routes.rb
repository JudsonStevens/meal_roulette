Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  root "homepages#index"
  namespace :admin do
    resources :restaurants
    resources :tags
    resources :users
  end
  resources :users do
    resources :tags, only: [:new, :create, :update, :index]
  end
end
