Rails.application.routes.draw do
  resources :albums
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
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

  # get 'albums/show'
  # root to: 'albums#show'
  
  # devise_for :models
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
