class VotesController < ApplicationController
  def new   
  end

  def create
    article = Article.find_by_id(params[:article_id])
    @vote = article.votes.build(user_id: current_user.id)

    if @vote.save
      redirect_to article, notice: "Vote was successfully created."            
    else
      redirect_to article, alert: @vote.errors.full_messages[0]
    end
  end
end
