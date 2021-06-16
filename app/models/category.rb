class Category < ApplicationRecord
  has_many :listings, foreign_key: :category_id
  has_many :articles, through: :listings, dependent: :destroy

  def cat_name
    name.to_s
  end
end
