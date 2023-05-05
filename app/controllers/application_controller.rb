class ApplicationController < ActionController::Base
  helper_method :user_data
  helper_method :user_posts

  def user_data
    @user_data ||= User.all
  end

  def user_posts
    @user_posts ||= Post.all
  end
end
