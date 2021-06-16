require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  before :each do
    User.create(name: 'newuser')
    file = Rails.root.join('app', 'assets', 'images', 'logo.png')
    image = ActiveStorage::Blob.create_and_upload!(io: File.open(file, 'rb'),
                                                   filename: 'logo.png',
                                                   content_type: 'image/png').signed_id

    @category = Category.create!(name: 'CategoryName', priority: 1)

    @article = @category.articles.create!(
      author_id: User.last.id,
      title: 'MyString10',
      text: 'MyTextWith_a_StringMoreThan30Chars',
      image: image
    )
  end

  describe 'vote generator for article' do
    it 'ask the user to login in order to vote' do
      visit "/articles/#{@article.id}"
      click_link 'Upvote this article'
      expect(page).to have_content 'Please log in.'
    end

    it 'creates the vote succesfully if user is logged in' do
      visit '/login'
      fill_in 'session_name', with: 'newuser'
      click_button 'Log in'
      visit "/articles/#{@article.id}"
      click_link 'Upvote this article'
      expect(page).to have_content 'Vote was successfully created.'
    end
  end
end
