class CommentController < ApplicationController
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def create
    @user2 = User.find(8)
    @post1 = Post.find(1)
    @comment = Comment.create(post: @post1, author: @user2, text: params[:text])
    @post1.comments_counter += 1
    @comment.save
    if @comment.save
      redirect_to comment_success_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      redirect_to user_posts_path(@post.author_id), notice: 'Post deleted successfully.'
    else
      redirect_to user_posts_path(user.id), alert: 'Failed to delete the post.'
    end
  end

  def new; end

  def comment_success; end
end
