Rails.application.routes.draw do
  
  devise_for :users
  root 'events#index'

  resources :articles do 
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
  end
  resources :events
  resources :users, only: [:show, :update, :edit]
end
