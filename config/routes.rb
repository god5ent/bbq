Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "events#index"

  resources :events
  resources :users, only: [:show, :edit, :update]
end
