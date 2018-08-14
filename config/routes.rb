Rails.application.routes.draw do
  devise_for :users
  root "landing#index"
  resources :home, only: :index
end
