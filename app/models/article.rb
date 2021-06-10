class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :listings, foreign_key: :article_id
  has_many :categories, through: :listings
  
  has_many :votes

  validates :title, presence: true, length: { in: 8..100 }
  validates :text, presence: true, length: { minimum: 30 }
  validates :image, presence: true
end
