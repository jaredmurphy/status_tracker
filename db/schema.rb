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

ActiveRecord::Schema.define(version: 2020_04_18_233344) do

  create_table "followed_users", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id"], name: "index_followed_users_on_follower_id"
    t.index ["following_id", "follower_id"], name: "index_followed_users_on_following_id_and_follower_id", unique: true
    t.index ["following_id"], name: "index_followed_users_on_following_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "do_not_disturb", default: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "login_token"
    t.datetime "login_token_valid_until"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "statuses", "users"
end
