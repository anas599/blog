require 'rspec'
require 'rails_helper'
RSpec.describe Comment, type: :model do
  let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post1) { Post.create(author: user1, title: 'Hello', text: 'This is my first post') }
  let(:comment1) { Comment.create(post: post1, author: user1, text: 'comment1') }

  describe 'new comment' do
    it 'should have a text' do
      expect(comment1.text).to eq('comment1')
    end
    it 'should have a author' do
      expect(comment1.author).to eq(user1)
    end
    it 'should have a post' do
      expect(comment1.post).to eq(post1)
    end
  end
  describe 'update comments counter' do
    it 'comments counter be nil' do
      expect(post1.comments_counter).to eq(nil)
    end
    it 'comments counter be 1' do
      comment1
      expect(post1.comments_counter).to eq(1)
    end
  end
end
