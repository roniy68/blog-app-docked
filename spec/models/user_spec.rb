require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validate presence of name' do
      user = User.new
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it 'should validate numericality of posts_counter' do
      user = User.new name: 'test', posts_counter: -1
      user.valid?
      expect(user.errors).to have_key(:posts_counter)
    end
  end

  describe 'recent_posts' do
    it 'should return recent_posts' do
      user = User.new name: 'test'
      expect(user.recent_posts.count).to eq(0)
    end
  end
end
