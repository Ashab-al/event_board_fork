Rails.application.routes.draw do
  
  devise_for :users
  root 'events#index'

  resources :articles do 
    resources :comments, only: [:create, :destroy]
    post 'destroy_all_comments', to: "comments#destroy_all"
  end

  resources :events do 
    resources :subscriptions, only: [:create, :destroy]
  end
  resources :users, only: [:show, :update, :edit]
end
