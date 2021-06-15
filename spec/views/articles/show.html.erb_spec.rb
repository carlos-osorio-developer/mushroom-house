require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before(:each) do
    User.create(name: 'NewUser')
    file = Rails.root.join('app', 'assets', 'images', 'logo.png')
    image = ActiveStorage::Blob.create_after_upload!(
      io: File.open(file, 'rb'),
      filename: 'logo.png',
      content_type: 'image/png'
    ).signed_id

    @category = assign(:category, Category.create!(
                                    name: 'CategoryName',
                                    priority: 1
                                  ))

    @categories = Category.all

    @article = @category.articles.create!(
      author_id: User.last.id,
      title: 'MyString10',
      text: 'MyTextWith_a_StringMoreThan30Chars',
      image: image
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/by Newuser/)
    expect(rendered).to match(/MyString10/)
    expect(rendered).to match(/MyTextWith_a_StringMoreThan30Chars/)
    expect(rendered).to match(rails_blob_url(@article.image))
  end
end
