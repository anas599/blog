require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create!(
        name: 'Hanna',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    end

    before(:example) do
      Post.create!(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      get user_posts_url(user)
    end

    it 'should return a post' do
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'GET /show' do
    let(:user) do
      User.create!(
        name: 'Hanna',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    end
    let(:post) do
      Post.create!(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    end

    before(:example) { get user_post_url(user, post) }

    it 'returns a successful response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'includes the post title and text in the response body' do
      expect(response.body).to include('Hello')
    end

    it 'renders the correct templates' do
      expect(response).to render_template('posts/show')
    end
  end
end
