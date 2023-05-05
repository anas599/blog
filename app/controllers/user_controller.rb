class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = user_data
  end
end
