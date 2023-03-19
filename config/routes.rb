Rails.application.routes.draw do
  get 'rooms/index'
  root to: "rooms#index"
end
