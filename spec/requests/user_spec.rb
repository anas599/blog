require 'rails_helper'

RSpec.describe 'User Page', type: :system do
  it 'shows the user name' do
    visit user_index_path
    expect(page).to have_content('Number of posts')
    expect(page).to have_content('Tom')
    expect(page).to have_content('image')
    sleep 5
  end
end