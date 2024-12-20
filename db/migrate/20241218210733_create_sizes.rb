class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes, id: :string do |t|
      t.references :item, foreign_key: true, type: :string
      t.string :name
      t.integer :inventory_amount

      t.timestamps
    end
  end
end
