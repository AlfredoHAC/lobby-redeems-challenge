class Redeem < ApplicationRecord
  EVALUATION_STATUSES = %w[
    pending
    approved
    rejected
  ].freeze

  belongs_to :redeem_page

  has_many :items, through: :redeem_page
  has_many :extra_questions_answers, class_name: 'Answer'

  enum :status, EVALUATION_STATUSES, default: :pending, validate: { allow_nil: false }

  validates :redeem_page,
            :redeemer_name,
            :redeemer_email,
            :redeemer_document_number,
            :redeemer_zipcode,
            :redeemer_street,
            :redeemer_number,
            :redeemer_neighborhood,
            :redeemer_city,
            :redeemer_state,
            presence: true
  validates :status, inclusion: { in: EVALUATION_STATUSES }

  validate :already_pending_redemption?

  private

  def already_pending_redemption?
    return if pending_redemptions.empty?

    errors.add(:base, :status,
               message: 'There is already a pending redemption for this page.')
  end

  def pending_redemptions
    Redeem.where(
      <<-SQL
        redeems.redeem_page_id = '#{redeem_page_id}'
        AND redeems.status = #{Redeem.statuses[:pending]}
        AND (
          redeems.redeemer_email = '#{redeemer_email}'
          OR
          redeems.redeemer_document_number = '#{redeemer_document_number}'
        )
      SQL
    )
  end
end
