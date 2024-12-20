class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, id: :string do |t|
      t.references :redeem_page, foreign_key: true, type: :string
      t.integer :answer_type
      t.string :question
      t.json :options, default: []

      t.timestamps
    end
  end
end
