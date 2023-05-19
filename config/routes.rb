Rails.application.routes.draw do
  devise_for :users

  root 'user#index'

  resources :user, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
 end

  namespace :api do
    post 'login', to: 'login#index'
    resources :user, only: [] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :show,:create]
      end
    end
  end

  get "new_post", to: "posts#new"
  post "new_post", to: "posts#create"
  get 'success', to: 'posts#success'
  get 'destroy_post', to: 'posts#destroy'

  get "new_comment", to: "comment#new"
  get 'destroy_comment', to: 'comment#destroy'
  post "new_comment", to: "comment#create"
end
