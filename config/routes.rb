Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :users
  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end
