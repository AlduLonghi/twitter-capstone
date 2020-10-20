Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "opinions#index"
  resources :opinions
  resources :followings
  resources :favorites, only: [:new, :create, :destroy]
end
