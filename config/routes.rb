Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:show, :edit, :update]
  resources :rooms do
    member do
      get 'move'
    end
    collection do
      get 'search'
    end
    resources :chats, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
    resources :requests, only: :create
    resources :permissions, only: [:new, :create]
    resources :comments, only: :create do
      resources :reply_comments, only: [:index, :create]
    end
  end
  resources :notifications, only: [:index, :update, :destroy]
  resources :events, only: [:index, :create]
end