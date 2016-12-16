Rails.application.routes.draw do

  root 'application#index'

  resources :users
  resources :sessions, only: [:new, :create]

  get '/about' => 'application#about'

  get '/contact' => 'application#contact'

  get "/login" => "sessions#new", :as => "log_in"

  get '/logout' => "sessions#destroy", :as => "log_out"

  get '/:username' => 'users#profile'

  get '/users/:id/file' => "users#delete_file", as: "delete_file"

  get '/users/:id/editlogin' => "users#edit_login", as: "edit_login"

  post '/users/:id/updatelogin' => "users#update_login", as: "update_login"

end
