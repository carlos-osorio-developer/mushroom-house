require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @user = User.create(name: 'NewUser')
    file = Rails.root.join('app', 'assets', 'images', 'logo.png')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'logo.png',
      content_type: 'image/png'
    ).signed_id

    @article = Article.create!(
      author_id: User.last.id,
      title: 'MyString10',
      text: 'MyTextWith_a_StringMoreThan30Chars',
      image: image
    )

    vote = @article.votes.build(user_id: @user.id)
    vote.save
  end

  describe 'unique vote checker' do
    it 'mark a vote as invalid if it is repeated' do
      vote = @article.votes.build(user_id: @user.id)
      expect(vote.valid?).to eq(false)
    end
  end
end
