require 'rails_helper'

RSpec.describe 'User index/show', type: :system do
  describe 'Test User index' do
    let(:user) do
      User.create!(
        name: 'Tom1',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0,
        email: 'test@mail.com',
        password: '123456'
      )
    end
    let(:post2) do
      Post.create!(author: user, title: 'Cap1', text: 'This is capybara1', comments_counter: 0, likes_counter: 0)
    end
    before(:each) do
      visit user_posts_path(user_id: user.id)
      post2.save
    end

    it 'should contain the user name' do
      expect(current_path).to eq(user_posts_path(user_id: user.id))
      expect(page).to have_content('Tom1')
    end

    it 'should contain the "Number of posts" text' do
      expect(page).to have_content('Number of posts')
    end

    it 'should contain the "image" text' do
      expect(page).to have_content('image')
    end

    it 'should navigate to the user show page' do
      click_link('Tom1', exact_text: true)
      sleep 1
      expect(current_path).to eq(user_path(user.id))
    end
  end
  describe 'Test User show' do
    let(:user) do
      User.create!(
        name: 'Tom1',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 0,
        email: 'test@mail.com',
        password: '123456'
      )
    end
    let(:post2) do
      Post.create!(author: user, title: 'Cap1', text: 'This is capybara1', comments_counter: 0, likes_counter: 0)
      Post.create!(author: user, title: 'Cap2', text: 'This is capybara2', comments_counter: 0, likes_counter: 0)
      Post.create!(author: user, title: 'Cap3', text: 'This is capybara3', comments_counter: 0, likes_counter: 0)
    end

    before(:each) do
      visit user_posts_path(user_id: user.id)
      click_link('Tom1', exact_text: true)
      post2.save
      sleep 1
    end

    it 'should contain the user name' do
      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content('Tom1')
    end

    it 'should contain the "Number of posts" text' do
      expect(page).to have_content('Number of posts')
    end

    it 'should contain the "image" text' do
      expect(page).to have_content('image')
    end
    it 'should contain user bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'should contain 3 latest posts' do
      expect(page).to have_content('Cap1')
      expect(page).to have_content('Cap2')
      expect(page).to have_content('Cap3')
    end
    it 'should contain a link to the post of latest 3 posts' do
      expect(page).to have_selector(:link_or_button, 'Cap1')
      expect(page).to have_selector(:link_or_button, 'Cap2')
      expect(page).to have_selector(:link_or_button, 'Cap3')
    end

    it 'should navigate to the user posts page' do
      expect(page).to have_selector(:link_or_button, 'See all posts')
      click_link('See all posts', exact_text: true)
      sleep 1
      expect(current_path).to eq(user_posts_path(user.id))
    end
  end
end
