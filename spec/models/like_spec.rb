require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'update_likes_counter' do
    it 'should update likes_counter' do
      user = User.create name: 'test'
      post = Post.create title: 'test', author_id: user.id, likes_counter: 0
      Like.create user_id: user.id, post_id: post.id

      expect(post.likes_counter).to eq(0)
    end
  end
end
