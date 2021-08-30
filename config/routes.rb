Rails.application.routes.draw do
  post 'register', to: 'auth#create', as: '/register'
  get 'login', to: 'auth#show', as: '/login'
  resources :user, only: [:create, :show, :update]
  resources :client, only: [:create, :show, :update, :destroy]
  resources :my_client, only: [:show, :update]
  resources :soap, only: [:create, :update, :destroy, :show]
end
