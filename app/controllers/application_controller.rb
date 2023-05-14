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

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name posts_counter])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name posts_counter])
  end
end
