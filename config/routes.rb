Rails.application.routes.draw do
  devise_for :users
  root "videos#index"
  resources :videos  do
    resources :books, only: [:show]
    collection do
      get 'search'
      get 'genre'
    end
  end
  resources :users, only: [:index,:show]
  
  post "books/:id/pay" => 'books#pay'
  get "users/:id/history" => "users#history"
  get "users/:id/profit" => "users#profit"
end
