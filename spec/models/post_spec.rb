require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'update_posts_counter' do
    it 'should update posts_counter' do
      user = User.create name: 'test', posts_counter: 0
      expect(user.posts_counter).to eq(0)
    end
  end

  describe 'recent_comments' do
    it 'should return recent comments' do
      user = User.create name: 'test'
      post = Post.create title: 'test', author_id: user.id

      3.times do
        Comment.create user_id: user.id, post_id: post.id
      end

      expect(post.recent_comments.count).to eq(3)
    end
  end

  describe 'validations' do
    it 'should validate title presence' do
      post = Post.new

      expect(post.valid?).to eq(false)
      expect(post.errors).to have_key(:title)
    end

    it 'should validate title length' do
      post = Post.new title: 'a' * 251

      expect(post.valid?).to eq(false)
      expect(post.errors).to have_key(:title)
    end

    it 'should validate numericality of comments_counter' do
      post = Post.new title: 'test', comments_counter: -1

      expect(post.valid?).to eq(false)
      expect(post.errors).to have_key(:comments_counter)
    end

    it 'should validate numericality of likes_counter' do
      post = Post.new title: 'test', likes_counter: -1

      expect(post.valid?).to eq(false)
      expect(post.errors).to have_key(:likes_counter)
    end
  end
end
