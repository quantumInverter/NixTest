module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def rating
    votes.sum(:rating)
  end
end