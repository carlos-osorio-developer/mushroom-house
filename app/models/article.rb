class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { in: 8..100 }
  validates :text, presence: true, length: { minimum: 30 }
  validates :image, presence: true
end
