Rails.application.routes.draw do

  # User session
  
  # Resources
  resources :offers
  #resources :sessions, only:[:create]


  # Test database <DEV>
  get "test", to: "home#test"

  # login/logout
  devise_for :user, :path => '', 
            :path_names => { 
              :sign_in => "login", 
              :sign_out => "logout", 
            }

  # Root
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
