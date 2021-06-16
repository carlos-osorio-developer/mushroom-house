# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    User.create(name: 'Admin')
    file = Rails.root.join('app', 'assets', 'images', 'coffee-grounds.jpg')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'coffee-grounds.jpg',
      content_type: 'image/jpg'
    ).signed_id

    Category.first.articles.create!(
      author_id: User.last.id,
      title: 'Common Mushroom Substrate Materials',
      text: "There are a wide range of materials that you can use as a substrate to grow mushrooms. Some are fairly conventional while others are a bit newer and more experimental. Here are some of the most common substrates that mushroom growers are currently using. 
      
      Coffee grounds \n 
      Straw \n
    Coco Coir and Vermiculite \n 
    Hardwood Pellets \n 
    Manure \n 
    Logs \n 
    Cardboard",
      image: image
    )