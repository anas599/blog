require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET /index' do
    before(:example) { get '/user' }
    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create!(
        name: 'Tom1',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    end

    before(:example) { get user_url(user) }

    it 'returns a successful response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'includes the user name and bio in the response body' do
      expect(response.body).to include('Tom')
      expect(response.body).to include('Teacher from Mexico.')
    end

    it 'renders the correct templates' do
      expect(response).to render_template('user/show')
      expect(response).to render_template('shared/_navbar')
    end
  end
  describe 'GET/index' do
    before(:example) { get '/user' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders the right template' do
      expect(response).to render_template('index')
    end
    it 'Include the correct text' do
      expect(response.body).to include('name')
    end
  end
end
