Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events
  resources :articles
  resources :users, only: [:show, :update, :edit]
end
