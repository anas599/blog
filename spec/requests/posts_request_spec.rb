require 'rails_helper'

RSpec.describe 'Posts controller' do
  it 'should return a post' do
    get '/users/1/posts/'
    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
    expect(response.body).to include('Post 1')
    expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur')
  end
  it 'should return single post text' do
    get '/users/1/posts/1'
    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
    expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit,')
  end
end
