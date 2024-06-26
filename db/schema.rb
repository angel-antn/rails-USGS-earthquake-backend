# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_12_014818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "earthquake_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
    t.bigint "user_id"
    t.index ["earthquake_id"], name: "index_comments_on_earthquake_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "earthquakes", force: :cascade do |t|
    t.string "type"
    t.string "external_id"
    t.decimal "magnitude"
    t.string "place"
    t.string "time"
    t.boolean "tsunami"
    t.string "mag_type"
    t.string "title"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "external_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "earthquakes"
  add_foreign_key "comments", "users"
end
