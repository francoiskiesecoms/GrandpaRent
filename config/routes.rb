Rails.application.routes.draw do
  get 'users/show'
  get 'bookings/create'
  devise_for :users
  root to: 'grandparents#index'
  resources :grandparents
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
