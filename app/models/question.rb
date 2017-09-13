class Question < ApplicationRecord
  include Votable

  belongs_to :user
  has_many :comments
end
