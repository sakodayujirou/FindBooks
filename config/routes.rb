Rails.application.routes.draw do
  devise_for :users
  root "videos#index"
  resources :videos  do
    collection do
      get 'search'
      get 'genle'
    end
  end
  resources :users, only: [:index,:show]
  resources :books, only: [:index,:show]
  post "books/:id/pay" => 'books#pay'
end
