Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  root to: "rooms#index"
end
