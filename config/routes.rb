Rails.application.routes.draw do

  root to: "pages#home"

  get 'scenes/autocomplete_scene_film_title'
  get 'lists/autocomplete_list_title'

  resources :users, :except => [:index]
  resources :lists

  get "/signup", to: "users#new", as: "signup"

  get "/about", to: "pages#about", as: "about"

  get "/scenes", to: "scenes#index", as: "scenes"
  get "/scenes/:id", to: "scenes#show", as: "scene"
  get "/scenes/:id/list/new", to: "lists#new", as: "scene_new_list"

  get "/listscenes", to: "listscenes#index", as: "list_scenes"
  post "/listscenes", to: "listscenes#create", as: "create_listscene"

  post "/sessions", to: "sessions#create"
  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy", as: "destroy_session"

end
