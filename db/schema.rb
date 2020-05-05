# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_05_140742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "working_time"
    t.integer "tables_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "table_reservations", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.bigint "user_id", null: false
    t.datetime "reserved_from"
    t.datetime "reserved_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_id"], name: "index_table_reservations_on_table_id"
    t.index ["user_id"], name: "index_table_reservations_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "number"
    t.boolean "reserved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reserved"], name: "index_tables_on_reserved"
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "table_reservations", "tables"
  add_foreign_key "table_reservations", "users"
  add_foreign_key "tables", "restaurants"
end
