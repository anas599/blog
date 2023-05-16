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
      post.save
    end

    it 'should contain the user name' do
      expect(current_path).to eq(user_posts_path(user.id))
      expect(page).to have_content('Tom2')
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('cap4')
      expect(page).to have_content('This is capybara2')
      sleep 1
    end

    it ' comments and likes on post' do
      expect(current_path).to eq(user_posts_path(user.id))
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('Comments')
      expect(page).to have_content('Likes')
      sleep 1
    end
  end

  describe 'post show page' do
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
    let(:post1) do
      Post.create!(author: user, title: 'cap4', text: 'This is capybara2', comments_counter: 0, likes_counter: 0)
    end
    let(:comment1) do
      Comment.create!(author: user, post: post1, text: 'Good post')
    end
    before(:each) do
      visit user_posts_path(user_id: user.id)
      post1.save
      comment1.save
    end

    it 'should contain the user name' do
      expect(current_path).to eq(user_posts_path(user.id))
      expect(page).to have_content('Tom2')
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('cap4')
      expect(page).to have_content('This is capybara2')
      sleep 1
      click_link('See all posts', exact_text: true)
      expect(page).to have_content('cap4')
      expect(page).to have_content('Comments')
      expect(page).to have_content('Good post')
    end

    it ' comments and likes on post' do
      expect(current_path).to eq(user_posts_path(user.id))
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('Posts')
      expect(page).to have_content('Likes')
      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('image')
      sleep 1
    end

    it 'number of likes and comments' do
      expect(current_path).to eq(user_posts_path(user.id))
      sleep 1
      click_link('Tom2', exact_text: true)
      expect(page).to have_content('Comments:2')
      expect(page).to have_content('Likes: 0')
    end
  end
end
