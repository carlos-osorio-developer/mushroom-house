require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  before(:each) do
    User.create(name: 'NewUser')
    file = Rails.root.join('app', 'assets', 'images', 'logo.png')
    image = ActiveStorage::Blob.create_after_upload!(
      io: File.open(file, 'rb'),
      filename: 'logo.png',
      content_type: 'image/png'
    ).signed_id
    @article = assign(:article, Article.create!(
                                  author_id: User.last.id,
                                  title: 'MyString10',
                                  text: 'MyTextWith_a_StringMoreThan30Chars',
                                  image: image
                                ))
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(@article), 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[text]'

      assert_select 'input[name=?]', 'article[image]'
    end
  end
end
