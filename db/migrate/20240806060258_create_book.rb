class CreateBook < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, limit: 255, null: false
      t.string :isbn_number_13, limit: 100, null: false
      t.string :isbn_number_10, limit: 100, null: false
      t.float :price, null: false
      t.datetime :publish_at, null: false
      t.string :edition, limit: 100

      t.timestamps
    end
  end
end
