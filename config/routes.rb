Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  root "homes#top"
  
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  
  resources :post_comments, only: [:create, :destroy]
  
  resource :favorites, only: [:create, :destroy]
  end
  

  get "/home/about" => "homes#about"
  
  
  
  resources :users
  resources :books
  
  
  #フォロー/フォロワー機能追加部分
  resources :users, only: [:index, :show, :edit, :update] do
# ——————————————— ここから ———————————————
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
# ——————————— ここまでネストさせる ———————————
end

end