class PostController < ApplicationController
  has_many :users
  def show
    @user
  end
end
