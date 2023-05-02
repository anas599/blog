RSpec.describe User, type: :model do
  let(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let!(:post1) { Post.create(author: user1, title: 'Hello1', text: 'This is my first post') }

  describe 'new user' do
    it 'should have a name' do
      expect(user1.name).to eq('Tom')
    end
    it 'should have a photo' do
      expect(user1.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    end
    it 'should have a bio' do
      expect(user1.bio).to eq('Teacher from Mexico.')
    end

    it 'posts counter should be nil' do
      expect(user1.posts_counter).to eq(nil)
    end
  end

  describe 'validations' do
    it 'should enter a name' do
      user1.name = nil
      expect(user1).to_not be_valid
    end
    it 'should enter a name with 20 characters or less' do
      user1.name = 'a' * 21
      expect(user1).to_not be_valid
    end
    it 'should enter a bio with 100 characters or less' do
      user1.bio = 'a' * 101
      expect(user1).to_not be_valid
    end
  end

  describe 'recent posts' do
    it 'should return 0 since no posts were added' do
      expect(user1.recent_posts.count).to eq(0)
    end
  end
end
