require 'rails_helper'

RSpec.describe 'Post index/show', type: :system do
  it 'Test Post index' do
    visit user_posts_path(42)
    sleep 5
    # expect(current_path).to eq(user_posts_path(42)+ "/posts")
    # expect(page).to have_content('Number of posts')
    # expect(page).to have_content('Tom')
    # expect(page).to have_content('image')
    # sleep 1
    # expect(page).to have_selector(:link_or_button, 'See all posts')
    # click_link('See all posts', exact_text: true)
    # sleep 1
    # expect(current_path).to eq(user_path(42))
    # sleep 2
  end
end
