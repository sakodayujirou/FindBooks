Rails.application.routes.draw do
  devise_for :users
  root "videos#index"
  resources :videos  do
  end
  resources :users, only: [:index]
  resources :books, only: [:index]
end
