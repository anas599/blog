class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.comments_counter(post)
    where(post:).count
  end

  def self.update_comments_counter(post)
    post.update(comments_counter: comments_counter(post))
  end
end
