Rails.application.routes.draw do
  devise_for :users

  root 'user#index'
     resources :user, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy ]
  end
  get "new_post", to: "posts#new"
  post "new_post", to: "posts#create"
  get 'success', to: 'posts#success'
  get 'destroy_post', to: 'posts#destroy'

  resources :comments, only: [:new, :create, :destroy]
  get "new_comment", to: "comment#new"
  post "new_comment", to: "comment#create"
  get "comment_success", to: "comment#comment_success"
  
end
