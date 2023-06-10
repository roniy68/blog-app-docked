require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'index' do
    before do
      visit user_posts_path(users(:iu))
    end

    it 'shows the user\'s profile picture' do
      photo_path = users(:iu).photo

      expect(page).to have_selector("img[src='#{photo_path}']")
    end

    it 'shows the user\'s username' do
      expect(page).to have_text(users(:iu).name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_text("Number of posts: #{users(:iu).posts_counter}")
    end

    it 'shows a post\'s title' do
      post = users(:iu).posts.first

      expect(page).to have_text(post.title)
    end

    it 'shows some of a post\'s body' do
      post = users(:iu).posts.first

      expect(page).to have_text(post.text)
    end

    it 'shows the first comments on a post' do
      post = posts(:dream)

      post.recent_comments.each do |comment|
        expect(page).to have_text(comment.text)
      end
    end

    it 'shows how many comments a post has' do
      post = posts(:dream)

      expect(page).to have_text("Comments: #{post.comments_counter}")
    end

    it 'shows how many likes a post has' do
      post = posts(:dream)

      expect(page).to have_text("Likes: #{post.likes_counter}")
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_text('Pagination')
    end

    it 'clicking on a post redirects to that post\'s show page' do
      post = users(:iu).posts.first
      click_on post.title

      expect(page).to have_current_path(user_post_path(users(:iu), post))
    end
  end
end
