Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  root "homes#top"
  
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  resources :post_comments, only: [:create, :destroy]
  end
  

  get "/home/about" => "homes#about"
  
  
  
  resources :users
  resources :books

end