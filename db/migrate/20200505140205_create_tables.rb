class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.string :number
      t.boolean :reserved, default: false

      t.timestamps
    end
    add_index :tables, :reserved
  end
end
