require 'rails_helper'

RSpec.describe 'User index/show', type: :system do
  it 'Test User index' do
    visit user_index_path
    expect(current_path).to eq(user_index_path)
    expect(page).to have_content('Number of posts')
    expect(page).to have_content('Tom')
    expect(page).to have_content('image')
    sleep 1
    click_link('Tom', exact_text: true)
    sleep 1
    expect(current_path).to eq(user_path(42))
    sleep 2
  end
  it 'Test User show' do
    visit user_path(42)
    expect(current_path).to eq(user_path(42))
    expect(page).to have_content('Tom')
    expect(page).to have_content('image')
    expect(page).to have_content('Number of posts')
    expect(page).to have_selector(:link_or_button, 'See all posts')
    click_link('See all posts', exact_text: true)
    sleep 1
    expect(current_path).to eq(user_posts_path(42))
    sleep 2
  end
end
