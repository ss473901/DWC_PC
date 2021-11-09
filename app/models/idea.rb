class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :proposer
end
