class ItemSerializer < ActiveModel::Serializer
  attribute :id, type: :string
  attribute :customer_product_id, type: :string
  attribute :quantity, type: :integer

  has_many :sizes
end
