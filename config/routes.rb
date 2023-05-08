Rails.application.routes.draw do

  root 'user#index'
  get 'users/:id', to: 'user#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/', to: 'user#index'
  get 'users/:id/posts/:id', to: 'posts#show'

  get "new_post", to: "posts#new"
  post "new_post", to: "posts#create"
  get 'success', to: 'posts#success'

  get "new_comment", to: "comment#new"
  post "new_comment", to: "comment#create"
  get "comment_success", to: "comment#comment_success"
  
end
