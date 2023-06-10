require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'show' do
    before do
      visit user_post_path(users(:ben), posts(:loving))
    end

    it 'shows the post\'s title' do
      expect(page).to have_text(posts(:loving).title)
    end

    it 'shows the post\'s author' do
      expect(page).to have_text(users(:ben).name)
    end

    it 'shows how many comments the post has' do
      expect(page).to have_text("Comments: #{posts(:loving).comments_counter}")
    end

    it 'shows how many likes the post has' do
      expect(page).to have_text("Likes: #{posts(:loving).likes_counter}")
    end

    it 'shows the post\'s body' do
      expect(page).to have_text(posts(:loving).text)
    end

    it 'shows the commentor\'s username' do
      comment = posts(:loving).comments.first

      expect(page).to have_text(comment.user.name)
    end

    it 'shows the comment' do
      comment = posts(:loving).comments.first

      expect(page).to have_text(comment.text)
    end
  end
end
