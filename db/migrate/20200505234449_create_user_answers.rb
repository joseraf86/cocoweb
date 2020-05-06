class CreateUserAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :poll_answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
