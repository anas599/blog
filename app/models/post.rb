class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes


  def self.posts_counter(user)
    where(author: user).count
  end

  def self.update_posts_counter(user)
    User.select(:id).find(user.id).update(posts_counter: posts_counter(user))
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
