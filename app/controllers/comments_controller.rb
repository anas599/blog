class CommentsController < ApplicationController
  load_and_authorize_resource
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  # def create
  #   @user2 = User.find(8)
  #   @post1 = Post.find(1)
  #   @comment = Comment.create(post: @post1, author: @user2, text: params[:text])
  #   @post1.comments_counter += 1
  #   @comment.save
  #   if @comment.save
  #     redirect_to comment_success_path
  #   else
  #     render :new
  #   end
  # end
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save

        format.html { redirect_to user_post_path(params[:user_id], params[:post_id]) }
      else
        render :new
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      redirect_to user_posts_path(user_id: params[:user_id], id: params[:post_id]),
                  notice: 'Post deleted successfully.'
    else
      redirect_to user_posts_path(user.id), alert: 'Failed to delete the post.'
    end
  end

  def new; end

  def comment_success; end
end
