class AddTypeColumnToUserAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :user_answers, :type, :string
  end
end
