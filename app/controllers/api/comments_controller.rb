class Api::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    posts = user.posts.find(params[:post_id])
    comments = posts.comments
    render json: comments
  end
end
