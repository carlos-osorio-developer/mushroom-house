require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  before :each do
    User.create(name: 'newuser')
    file = Rails.root.join('app', 'assets', 'images', 'logo.png')
    image = ActiveStorage::Blob.create_after_upload!(
      io: File.open(file, 'rb'),
      filename: 'logo.png',
      content_type: 'image/png'
    ).signed_id

    @category = Category.create!(
      name: 'CategoryName',
      priority: 1
    )

    @categories = Category.all

    @article = @category.articles.create!(
      author_id: User.last.id,
      title: 'MyString10',
      text: 'MyTextWith_a_StringMoreThan30Chars',
      image: image
    )
  end

  describe 'session manager' do
    it 'login me succesfully' do
      visit '/login'
      fill_in 'session_name', with: 'newuser'
      click_button 'Log in'
      expect(page).to have_content 'NEWUSER | LOG OUT'
    end
  end
end
