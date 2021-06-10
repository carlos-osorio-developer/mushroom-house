class Category < ApplicationRecord
  belongs_to :listed_category, class_name: 'Category'
  
  has_many :listings, foreign_key: :category_id
  has_many :articles, through: :listings
end
