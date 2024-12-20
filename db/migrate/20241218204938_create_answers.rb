class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers, id: :string do |t|
      t.references :question, foreign_key: true, type: :string
      t.references :redeem, foreign_key: true, type: :string
      t.string :answer

      t.timestamps
    end
  end
end
