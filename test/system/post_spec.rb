require 'rails_helper'

RSpec.describe 'Post index/show', type: :system do
  describe 'post index page' do
    let(:user) do
      User.create!(
        name: 'Tom2',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0,
        email: 'test@mail.com',
        password: '123456'
      )
    end
    let(:post) do
      Post.create!(author: user, title: 'cap4', text: 'This is capybara2', comments_counter: 0, likes_counter: 0)
    end
    before(:each) do
      visit user_posts_path(user_id: user.id)
    end

    it 'should contain the user name' do
      post.save
      expect(current_path).to eq(user_posts_path(user.id))
      expect(page).to have_content('Tom2')
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('cap4')
      expect(page).to have_content('This is capybara2')
      sleep 1
    end
  end
end
