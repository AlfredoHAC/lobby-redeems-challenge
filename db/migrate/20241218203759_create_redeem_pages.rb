class CreateRedeemPages < ActiveRecord::Migration[7.1]
  def change
    create_table :redeem_pages, id: :string do |t|
      t.string :title
      t.integer :status
      t.string :administrative_link
      t.string :redemption_link

      t.timestamps
    end
  end
end
