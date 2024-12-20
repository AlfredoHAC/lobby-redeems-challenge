class RedeemPage < ApplicationRecord
  STATUSES = %w[
    active
    inactive
  ].freeze

  has_many :redeems
  has_many :extra_questions, class_name: 'Question', autosave: true
  has_many :items, autosave: true

  enum :status, STATUSES, default: :active

  validates :items, presence: true

  scope :with_sized_products, -> { includes(:items, items: :sizes) }
  scope :with_extra_questions, -> { includes(:extra_questions) }
end
