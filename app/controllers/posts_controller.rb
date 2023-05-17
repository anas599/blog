class PostsController < ApplicationController
  def show; end

  def index; end

  def new
    @user1 = current_user
    @post = Post.new
  end

  def create
    @post = Post.create(author_id: current_user.id, title: params[:post][:title], text: params[:post][:text],
                        comments_counter: 0, likes_counter: 0)
    if @post.save
      redirect_to success_path
    else
      render :new

    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post

    if @post.destroy
      redirect_to user_path(@user), notice: 'Post deleted successfully.'
    else
      redirect_to user_path(@user), alert: 'Failed to delete the post.'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def success; end
end
