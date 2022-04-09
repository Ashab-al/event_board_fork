Rails.application.routes.draw do
  
  devise_for :users
  root 'events#index'

  resources :users do 
    member do 
      get :confirmed_email
    end
  end
  
  resources :articles do 
    resources :comments, only: [:create, :destroy]
    member { post :like }
    post 'destroy_all_comments', to: "comments#destroy_all"
  end

  resources :events do 
    resources :subscriptions, only: [:create, :destroy]
    post :show, on: :member
  end

  resources :users, only: [:index, :show, :update, :edit]

end
