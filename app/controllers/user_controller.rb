class UserController < ApplicationController
  def show
    @user = user_data.first
  end

  def index
    @user = user_data
  end
end
