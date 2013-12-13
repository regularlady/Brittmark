Brittmark::Application.routes.draw do

  resources :user_bookmarks


  devise_for :users

  resources :bookmarks

  match "about" => 'welcome#about', via: :get

  match "mybookmarks" => 'bookmarks#mybookmarks', via: :get

  root :to => 'welcome#index'

  get 'tags/:tag', to: 'bookmarks#index', as: :tag
end