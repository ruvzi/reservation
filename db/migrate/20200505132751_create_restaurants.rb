class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.json :working_time
      t.integer :tables_count

      t.timestamps
    end
  end
end
