Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:show, :edit, :update]
  resources :rooms do
    resources :chats, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
  end
  resources :notifications, only: [:index, :update]
end
