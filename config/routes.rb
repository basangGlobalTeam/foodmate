Rails.application.routes.draw do
  devise_for :users
  
  unauthenticated  do
    root "landing#index"
  end

  authenticated  do
    root "home#index"
  end

  resources :home, only: :index
  resources :users, only: :show
end
