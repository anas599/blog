Rails.application.routes.draw do
  root 'home#index'
  get 'users/:id', to: 'user#show'
  get 'users/:id/posts', to: 'user#posts'
  get 'users/:id/posts/:id', to: 'user#posts_show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
