class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
