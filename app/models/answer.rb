class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :redeem

  validates :answer, presence: true
end
