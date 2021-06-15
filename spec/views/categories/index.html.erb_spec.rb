require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
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

    @category.articles.create!(
      author_id: User.last.id,
      title: 'MyString10',
      text: 'MyTextWith_a_StringMoreThan30Chars',
      image: image
    )
  end

  it 'renders a list of categories' do
    render
    expect(rendered).to match(/MyString10/)
    expect(rendered).to match(/MyTextWith_a_StringMoreThan30Chars/)
    expect(rendered).to match(rails_blob_url(@category.articles[0].image))
  end
end
