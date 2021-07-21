Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  root "homes#top"
  
  

  get "/home/about" => "homes#about"
  
  
  
  resources :users
  resources :books

end