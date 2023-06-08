require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'show' do
    before do
      visit user_path(users(:iu))
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

    it 'shows the user\'s bio' do
      expect(page).to have_text(users(:iu).bio)
    end

    it 'shows the user\'s first 3 posts' do
      posts = users(:iu).recent_posts

      posts.each do |post|
        expect(page).to have_text(post.title)
      end
    end

    it 'shows a button that lets me view all of a user\'s posts' do
      expect(page).to have_selector('a', text: 'See all posts')
    end

    it 'clicking on a user\'s post redirects to that post\'s show page' do
      post = users(:iu).recent_posts.first
      click_on post.title

      expect(page).to have_current_path(user_post_path(users(:iu), post))
    end

    it 'clicking to see all posts redirects me to the user\'s post\'s index page' do
      click_on 'See all posts'

      expect(page).to have_current_path(user_posts_path(users(:iu)))
    end
  end
end
