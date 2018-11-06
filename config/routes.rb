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
    resources :reviews, only: [:index, :new, :create, :show]
<<<<<<< HEAD
    resources :bookings, only: [:create]

=======
    resources :bookings, only: [:create, :edit, :update]
>>>>>>> 5b71372d44c5bf1bdf4145a4bea3d437b68c5954
  end
  root to: 'grandparents#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





