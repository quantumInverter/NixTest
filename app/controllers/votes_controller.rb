class VotesController < ApplicationController
  before_action :create_or_update, only: :create
  before_action :set_vote, only: :update

  # HACK: I should make it right
  def create
    if @vote
      respond_to do |format|
        if @vote.update_attributes(rating: params[:vote][:rating].to_i + @vote.rating)
          format.js
        end
      end
    else
      @vote = current_user.votes.new(vote_params)

      if params[:comment_id]
        votable = Comment.find(params[:comment_id]) if Comment.exists?(params[:comment_id])
      else
        votable = Question.find(params[:question_id]) if Question.exists?(params[:question_id])
      end

      @vote.votable = votable

      respond_to do |format|
        if @vote.save
          format.js
        end
      end
    end
  end

  def update
  end

  private

    def vote_params
      params.require(:vote).permit(:rating)
    end

    def create_or_update
      if params[:comment_id] && current_user.votes.where(votable_id: params[:comment_id], votable_type: 'Comment').any?
        @vote = current_user.votes.where(votable_id: params[:comment_id], votable_type: 'Comment').first
      elsif params[:question_id] && current_user.votes.where(votable_id: params[:question_id], votable_type: 'Question').any?
        @vote = current_user.votes.where(votable_id: params[:question_id], votable_type: 'Question').first
      end
    end
end
