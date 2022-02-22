Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments
  devise_for :users
  resources :users
  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

  end

  resources :users, only: [:show, :edit, :update]
end
