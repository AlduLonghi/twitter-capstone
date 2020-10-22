Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "opinions#index"
  resources :opinions
  resources :followings
  resources :favorites, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show, :destroy]

  get 'trends', to: "opinions#trends"
end
