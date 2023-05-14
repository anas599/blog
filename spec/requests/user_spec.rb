require 'rails_helper'

RSpec.describe 'User Page', type: :system do
  it 'shows the user name' do
    visit user_index_path
    expect(page).to have_content('Number of posts')
    expect(page).to have_content('Tom')
    expect(page).to have_content('image')
    sleep 3
  end
  it 'shows the user posts' do
    visit user_path(42)
    expect(page).to have_content('Bio')
    expect(page).to have_content('Posts')
    sleep 2
  end
end
