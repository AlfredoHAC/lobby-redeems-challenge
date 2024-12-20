class RedeemSerializer < ActiveModel::Serializer
  attribute :id, type: :string
  attribute :status, type: :string
  attribute :redeemer_name, type: :string
  attribute :redeemer_email, type: :string
  attribute :redeemer_document_number, type: :string
  attribute :redeemer_zipcode, type: :string
  attribute :redeemer_street, type: :string
  attribute :redeemer_number, type: :string
  attribute :redeemer_neighborhood, type: :string
  attribute :redeemer_city, type: :string
  attribute :redeemer_state, type: :string
  attribute :redeemer_country, type: :string
  attribute :redeemer_phone, type: :string

  belongs_to :redeem_page

  has_many :items
end
