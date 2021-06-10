class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :votes

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
end
