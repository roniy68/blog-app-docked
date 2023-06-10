require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index' do
    before do
      visit users_path
    end

    it 'should shows all users' do
      users.each do |user|
        expect(page).to have_text(user.name)
      end
    end

    it 'should show the profile picture for each user' do
      users.each do
        expect(page).to have_selector('img')
      end
    end

    it 'should show the number of posts each user has written' do
      users.each do |user|
        expect(page).to have_text("Number of posts: #{user.posts_counter}")
      end
    end

    it 'should redirect to that user\'s show page when clicking on a user' do
      click_on users(:ben).name

      expect(page).to have_current_path(user_path(users(:ben)))
    end
  end
end
