class SizeSerializer < ActiveModel::Serializer
  attribute :id, type: :string
  attribute :name, type: :string
  attribute :inventory_amount, type: :integer

  belongs_to :item
end
