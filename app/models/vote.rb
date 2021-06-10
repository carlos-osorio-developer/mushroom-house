class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article  

  validate :vote_is_unique

  def vote_is_unique
    if Vote.where(user_id: user_id, article_id: article_id).exists?
      self.errors.add(:user_id, 'has already voted for this article')
    end
  end
end
