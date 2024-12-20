class CreateRedeems < ActiveRecord::Migration[7.1]
  def change
    create_table :redeems, id: :string do |t|
      t.integer :status
      t.references :redeem_page, foreign_key: true, type: :string
      t.string :redeemer_name
      t.string :redeemer_email
      t.string :redeemer_document_number
      t.string :redeemer_zipcode
      t.string :redeemer_street
      t.string :redeemer_number
      t.string :redeemer_complement
      t.string :redeemer_neighborhood
      t.string :redeemer_city
      t.string :redeemer_state
      t.string :redeemer_country
      t.string :redeemer_phone

      t.timestamps
    end
  end
end
