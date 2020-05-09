class RenameAnswer12ColumnToOpenQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_column :polls, :answer12, :open_question
  end
end
