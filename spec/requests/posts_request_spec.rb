require 'rails_helper'

RSpec.describe 'Testing Posts controller' do
  it 'should return a post' do
    user = User.create!(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher fr Mexico.',
                        posts_counter: 0)
    Post.create(id: 1, author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
    get '/user/1/posts'
    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
    expect(response.body).to include('Hello')
    expect(response.body).to include('This is my first post')
    expect(response).to render_template('shared/_navbar', 'posts/index')
  end
end
