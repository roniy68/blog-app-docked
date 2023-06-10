require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'update_comments_counter' do
    it 'should update comments_counter' do
      user = User.create name: 'test'
      post = Post.create title: 'test', author_id: user.id, comments_counter: 0
      Comment.create user_id: user.id, post_id: post.id

      expect(post.comments_counter).to eq(0)
    end
  end
end
