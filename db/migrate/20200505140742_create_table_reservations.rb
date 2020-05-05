class CreateTableReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :table_reservations do |t|
      t.belongs_to :table, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :reserved_from
      t.datetime :reserved_to

      t.timestamps
    end
  end
end
