class User < ApplicationRecord
  has_many :posts
  def find_posts(author_id)
    Post.where(author_id:).order(created_at: :desc).limit(3)
  end

  def count_post
    Post.count
  end

  def update_posts_counter
    update(posts_counter: count_post)
  end

  def recent_5_comments
    Comment.where(author_id: id).order(created_at: :desc).limit(5)
  end

  def comment_counter_post
    Comment.count
  end

  def update_comments_counter
    update(comments_counter: comment_counter_post)
  end

  def likes_counter_post
    Like.count
  end

  def update_likes_counter
    update(likes_counter: likes_counter_post)
  end
end
