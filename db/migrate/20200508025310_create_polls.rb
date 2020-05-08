class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :answer1
      t.boolean :answer2
      t.boolean :answer3
      t.boolean :answer4
      t.boolean :answer5
      t.boolean :answer6
      t.boolean :answer7
      t.boolean :answer8
      t.boolean :answer9
      t.boolean :answer10
      t.boolean :answer11
      t.text :answer12

      t.timestamps
    end
  end
end
