Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :posts do
    resources :comments
  end
end
