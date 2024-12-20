class Question < ApplicationRecord
  ANSWER_TYPES = %w[
    text
    text_area
    select_one
    select_multiple
    date
    date_time
  ].freeze

  belongs_to :redeem_page

  has_many :answers, dependent: :destroy

  enum :answer_type, ANSWER_TYPES

  validates :answer_type, :question, presence: true
  validates :answer_type, inclusion: { in: ANSWER_TYPES, message: '%{value} is not a valid answer type.' }
end
