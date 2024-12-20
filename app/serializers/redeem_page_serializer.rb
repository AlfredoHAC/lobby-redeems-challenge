class RedeemPageSerializer < ActiveModel::Serializer
  attribute :id, type: :string
  attribute :title, type: :string
  attribute :administrative_link, type: :string
  attribute :redemption_link, type: :string

  has_many :items
  has_many :extra_questions
end
