class Item < ApplicationRecord
  belongs_to :redeem_page

  has_many :sizes

  validates :customer_product_id, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
