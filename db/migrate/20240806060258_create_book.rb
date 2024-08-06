class CreateBook < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, limit: 255, null: false
      t.string :isbn_number, limit: 100, null: false
      t.float :price, null: false
      t.datetime :publish_at, null: false
      t.string :string, limit: 100, null: false

      t.timestamps
    end
  end
end
