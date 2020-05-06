class CreateOpenAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :open_answers do |t|
      t.text :content
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
