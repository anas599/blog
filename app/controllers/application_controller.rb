class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name posts_counter])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name posts_counter])
  end

  def set_current_user
    @current_user = current_user
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome back, #{resource.name}!" # Modify the message as desired
    super
  end

  def user_data
    @user_data ||= User.all
  end

  def user_posts
    @user_posts ||= Post.all
  end
end
