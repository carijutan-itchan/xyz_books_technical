class RenameColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :string, :edition
    change_column_null :books, :edition, true
  end
end
