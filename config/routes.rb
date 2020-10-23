Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "opinions#index"
  resources :opinions, except: [:show]
  resources :followings, only: [:index, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :users, only: [:show, :destroy]

  get 'trends', to: "opinions#trends"
end
