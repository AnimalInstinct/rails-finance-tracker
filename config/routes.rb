Rails.application.routes.draw do
  resources :user_stocks, only: %i[create destroy]
  resources :users, only: %i[index]
  get 'stocks/search'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_user', to: 'users#search'
end
