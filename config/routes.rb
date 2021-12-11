Rails.application.routes.draw do
  resources :offers
  #get 'home/index'
  get 'home/login'
  get 'home/test'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
