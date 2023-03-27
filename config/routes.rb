Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:show, :edit, :update]
  resources :rooms do
    member do
      get 'move'
    end
    resources :chats, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
    resources :requests, only: :create
    resources :permissions, only: [:new, :create]
  end
  resources :notifications, only: [:index, :update]
end