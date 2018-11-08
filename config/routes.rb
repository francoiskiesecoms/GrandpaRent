Rails.application.routes.draw do

  get 'reviews/new'
  get 'reviews/create'
  get '/profile', to: 'profiles#dashboard'
  get '/profile/edit', to: 'profiles#edit'
  get '/profile/:id', to: 'profiles#show', as: :showprofile


  patch '/user', to: 'profiles#update'
  # resources :users, only: [:show, :edit, :update]
  devise_for :users
  resources :grandparents do
    resources :bookings, only: [:create, :edit, :update, :index]

  end
  root to: 'grandparents#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





