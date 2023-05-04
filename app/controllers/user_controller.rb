class UserController < ApplicationController
  def show
    @user = user_data.first
  end

  def posts
    @posts = user_posts
  end

  def posts_show; end
end
