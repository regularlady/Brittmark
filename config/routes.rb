Brittmark::Application.routes.draw do

  devise_for :users

  resources :bookmarks

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'

  get 'tags/:tag', to: 'bookmarks#index', as: :tag
end