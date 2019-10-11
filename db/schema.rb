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

ActiveRecord::Schema.define(version: 2019_10_11_010826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_orders", force: :cascade do |t|
    t.text "description"
    t.bigint "restaurant_food_id", null: false
    t.bigint "outing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["outing_id"], name: "index_food_orders_on_outing_id"
    t.index ["restaurant_food_id"], name: "index_food_orders_on_restaurant_food_id"
  end

  create_table "outings", force: :cascade do |t|
    t.text "description"
    t.datetime "meeting_time"
    t.float "total"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_outings_on_restaurant_id"
  end

  create_table "restaurant_foods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_restaurant_foods_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.float "longitude"
    t.float "latitude"
    t.string "web_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "food_orders", "outings"
  add_foreign_key "food_orders", "restaurant_foods"
  add_foreign_key "outings", "restaurants"
  add_foreign_key "restaurant_foods", "restaurants"
end
