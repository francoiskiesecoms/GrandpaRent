Rails.application.routes.draw do

  get '/profile', to: 'profiles#dashboard'
  post '/user', to: 'users#update'
  devise_for :users
  resources :grandparents
  root to: 'grandparents#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



