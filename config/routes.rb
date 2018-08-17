Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  unauthenticated  do
    root "landing#index"
  end

  authenticated  do
    root "home#index"
  end

  resources :users, only: :show do
    resources :follows, only: [:create, :destroy]
    resources :followers, only: :index
    resources :followings, only: :index
  end
  resources :images, only: [:create]
  resources :notfound, only: :index
  resources :posts, only: [:show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end
  resources :password, only: :edit
end
