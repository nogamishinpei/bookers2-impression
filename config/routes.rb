Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  
  
  resources :books
  resources :users, only: [:new, :create, :index, :show, :destroy]

end

