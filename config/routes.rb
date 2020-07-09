Rails.application.routes.draw do
  devise_for :users
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
 resources :users,only: [:show,:index,:edit,:update] do
    member do
     get :following, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'
end
