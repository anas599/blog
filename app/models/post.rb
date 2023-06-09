class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
