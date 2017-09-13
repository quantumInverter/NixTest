class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(vote_params)
    @vote.votable = params[:question_id] if Question.exists?(params[:question_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.question, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        # format.html { redirect_to :back }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

    def comment_params
      params.require(:vote).permit(:rating)
    end
end
