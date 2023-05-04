class PostsController < ApplicationController
  def show
    @user
  end

  def index
    @posts = user_posts
  end
end
