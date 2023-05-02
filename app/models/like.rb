class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.likes_counter(post)
    where(post:).count
  end

  def self.update_likes_counter(post)
    post.update(likes_counter: likes_counter(post))
  end
end
