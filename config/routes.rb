Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/spin-the-wheel', to: "homepages#show"
  root "homepages#index"
  namespace :admin do
    resources :restaurants
    resources :tags, only: [:index, :show]
    resources :users
  end
  resources :users, except: [:index] do
    resources :tags, only: [:new, :create, :update, :show]
  end
end
