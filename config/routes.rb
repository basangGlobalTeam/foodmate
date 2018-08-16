Rails.application.routes.draw do
  devise_for :users
  
  unauthenticated  do
    root "landing#index"
  end

  authenticated  do
    root "home#index"
  end

  resources :users, only: :show
  resources :images, only: [:create]
  resources :posts, only: [:show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:update, :destroy]
  end
end
