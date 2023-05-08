class ApplicationController < ActionController::Base
  helper_method :user_data
  helper_method :user_posts
  helper_method :current_user
  def user_data
    @user_data ||= User.all
  end

  def user_posts
    @user_posts ||= Post.all
  end

  def current_user
    @current_user ||= User.find(7)
  end
end
