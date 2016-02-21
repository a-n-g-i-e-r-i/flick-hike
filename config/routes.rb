Rails.application.routes.draw do

  root to: "pages#home"

  resources :users, :lists

  get "/signup", to: "users#new", as: "signup"

  get "/about", to: "pages#about", as: "about"

  get "/scenes", to: "scenes#index", as: "scenes"
  get "/scenes/:id", to: "scenes#show", as: "scene"
  get "/scenes/:id/lists/new", to: "lists#new", as: "scene_new_list"

  post "/sessions", to: "sessions#create"
  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy", as: "destroy_session"

end
