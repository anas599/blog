class Api::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    posts = user.posts.find(params[:post_id])
    comments = posts.comments
    render json: comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = @auth_user
    @comment.post = @post

    if @comment.save
      render json: { status: 'Success', data: @comment }
    else
      render json: { status: 'Failure', error: @comment.errors.full_messages }
    end
  end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
