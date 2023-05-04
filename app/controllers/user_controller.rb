class UserController < ApplicationController
  def show
    @user = user_data.first
  end

  #   def posts_show; end
  def index
    @user = user_data
  end
end
