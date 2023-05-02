require 'rspec'
require 'rails_helper'
RSpec.describe Post, type: :model do
  let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post1) { Post.create(author: user1, title: 'Hello', text: 'This is my first post') }

  describe 'new post' do
    it 'should have a title' do
      expect(post1.title).to eq('Hello')
    end
    it 'should have a text' do
      expect(post1.text).to eq('This is my first post')
    end
    it 'should have a author' do
      expect(post1.author).to eq(user1)
    end
    it 'should have a likes counter' do
      expect(post1.likes_counter).to eq(nil)
    end
    it 'should have a comments counter' do
      expect(post1.comments_counter).to eq(nil)
    end
  end
  describe 'validations' do
    it 'should enter a title' do
      post1.title = nil
      expect(post1).to_not be_valid
    end
    it 'should enter a text' do
      post1.text = nil
      expect(post1).to_not be_valid
    end
    it 'should enter a title with 250 characters or less' do
      post1.title = 'a' * 251
      expect(post1).to_not be_valid
    end
  end
end
