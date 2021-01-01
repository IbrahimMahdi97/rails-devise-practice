Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: 
  { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'secret', 
    confirmation: 'verification', 
    unlock: 'unblock', 
    registration: 'register', 
    sign_up: 'cmon_let_me_in' 
  }

  get 'pages/home'
  root to: 'pages#home'
  resources :albums
  post '/albums/new' => 'albums#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
