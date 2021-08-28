Rails.application.routes.draw do
  post 'register', to: 'auth#create', as: '/register'
  get 'login', to: 'auth#show', as: '/login'
end
