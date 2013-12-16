Brittmark::Application.routes.draw do

  resources :user_bookmarks
   
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :bookmarks

  resources :users

  match "about" => 'welcome#about', via: :get

  match "mybookmarks" => 'bookmarks#mybookmarks', via: :get

  root :to => 'welcome#index'

  get 'tags/:tag', to: 'bookmarks#index', as: :tag
end