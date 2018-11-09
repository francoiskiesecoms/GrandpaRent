Rails.application.routes.draw do

  resources :profiles do

  end


  get 'profiles/:id/grandparents', to: 'grandparents#someone_grandparents', as: :someonepa
  get 'profiles/:id/bookings', to: 'profiles#someone_bookings', as: :someonebo

  patch '/user', to: 'profiles#update'
  # resources :users, only: [:show, :edit, :update]
  devise_for :users
  resources :grandparents do
    resources :bookings, only: [:create, :edit, :update, :index]
  end
  root to: 'grandparents#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





