Rails.application.routes.draw do
  resources :group_resources
  resources :group_users
  resources :groups
  resources :questions
  resources :users
  post '/auth/login', to: 'authentication#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
