require 'rails_helper'

describe 'Testing the user controller' do
  it 'renders a successful response' do
    user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
    get user_url(user)
    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(response.body).to include('Tom')
    expect(response.body).to include('Teacher from Mexico.')
    expect(response).to render_template('user/show', 'shared/_navbar')
  end
end
