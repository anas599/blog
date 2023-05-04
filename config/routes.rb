Rails.application.routes.draw do
  root 'user#index'
  get 'users/:id', to: 'user#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/', to: 'user#index'
  get 'users/:id/posts/:id', to: 'posts#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
