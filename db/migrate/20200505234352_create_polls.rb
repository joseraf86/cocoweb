class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
