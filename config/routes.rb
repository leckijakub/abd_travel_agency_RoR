Rails.application.routes.draw do

  # Test database <DEV>
  get "test", to: "home#test"

  # Resources
  resources :sessions, only:[:create]
  resources :offers

  # login/logout
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Root
  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
