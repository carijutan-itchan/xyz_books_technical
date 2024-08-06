class CreatePublisher < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :name, limit: 100, null: false

      t.timestamps
    end
  end
end
