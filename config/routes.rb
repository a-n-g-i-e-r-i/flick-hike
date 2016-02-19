Rails.application.routes.draw do

  root to: "users#index"

  resources :users

  post "/sessions", to: "sessions#create"
  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy", as: "destroy_session"

end
