Rails.application.routes.draw do

  root 'user#index'
     resources :user, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  get "new_post", to: "posts#new"
  post "new_post", to: "posts#create"
  get 'success', to: 'posts#success'

  get "new_comment", to: "comment#new"
  post "new_comment", to: "comment#create"
  get "comment_success", to: "comment#comment_success"
  
end
