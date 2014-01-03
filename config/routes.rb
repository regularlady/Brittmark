Brittmark::Application.routes.draw do

  resources :user_bookmarks 
   
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bookmarks do 
    resources :likes, only: [:create, :destroy]
  end

  resources :users

  match "about" => 'welcome#about', via: :get

  match "mybookmarks" => 'bookmarks#mybookmarks', via: :get

  root :to => 'welcome#index'

  authenticate :user do
    root to: 'bookmarks#mybookmarks'
  end 

  get 'tags/:tag', to: 'bookmarks#index', as: :tag
end