class HomeController < ApplicationController
  def index
    @user = user_data
  end
end
