class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items, id: :string do |t|
      t.string :customer_product_id
      t.references :redeem_page, foreign_key: true, type: :string
      t.integer :quantity

      t.timestamps
    end
  end
end
