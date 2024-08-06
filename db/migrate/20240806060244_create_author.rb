class CreateAuthor < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :first_name, limit: 100, null: false
      t.string :last_name, limit: 100, null: false
      t.string :middle_name, limit: 100

      t.timestamps
    end
  end
end
