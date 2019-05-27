Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :posts
end
