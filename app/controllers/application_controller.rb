class ApplicationController < ActionController::Base
  helper_method :user_data
  helper_method :user_posts

  def user_data
    @user_data ||= [{ id: 1, name: 'User',
                      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', posts_num: 3, pic: 'image' }] * 6
  end

  def user_posts
    @user_posts ||= [{ id: 1, title: 'Post 1',
                       content: 'Lorem ipsum dolor sit amet, consectetur  ', user_id: 1, pic: 'image' }] * 3
  end
end
