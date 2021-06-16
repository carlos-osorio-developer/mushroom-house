class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validate :vote_is_unique

  def vote_is_unique
    vote = Vote.where(user_id: user_id, article_id: article_id)
    errors.add(:user_id, 'has already voted for this article') if vote.exists?
  end
end
