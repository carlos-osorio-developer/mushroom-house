class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :listings, foreign_key: :article_id
  has_many :categories, through: :listings, dependent: :destroy
  
  has_many :votes, dependent: :destroy

  validates :title, presence: true, length: { in: 8..100 }
  validates :text, presence: true, length: { minimum: 30 }
  validates :image, presence: true

  has_one_attached :image

  scope :most_popular, lambda {
    if Vote.any?
      joins(:votes)
      .group(:id)
      .order('COUNT(votes.article_id) desc')
      .first
    else
      most_recent
    end
  }

  scope :most_recent, -> { order('created_at desc').first }

end
