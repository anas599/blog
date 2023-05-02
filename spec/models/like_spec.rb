require 'rspec'
require 'rails_helper'
RSpec.describe Like, type: :model do
  let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post1) { Post.create(author: user1, title: 'Hello', text: 'This is my first post') }
  let(:comment1) { Comment.create(post: post1, author: user1, text: 'comment1') }
  let(:like1) { Like.create(post: post1, author: user1) }

  describe 'new like' do
    it 'should have a author' do
      expect(like1.author).to eq(user1)
    end
    it 'should have a post' do
      expect(like1.post).to eq(post1)
    end
  end
  describe 'update likes counter' do
    it 'likes counter be nil' do
      expect(post1.likes_counter).to eq(nil)
    end
    it 'likes counter be 1' do
      like1
      expect(post1.likes_counter).to eq(1)
    end
  end
end
