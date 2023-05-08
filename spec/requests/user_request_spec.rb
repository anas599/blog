require 'rails_helper'

RSpec.describe 'User controller' do
  it 'should return a user' do
    get '/users/1'
    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
    expect(response.body).to include('name')
    expect(response.body).to include('id')
    expect(response.body).to include('Number of posts:')
    expect(response.body).to include('image')
  end
end
