# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_17_023706) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_foods_on_name"
  end

  create_table "images", force: :cascade do |t|
    t.integer "user_id"
    t.string "file", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.text "content", default: ""
    t.string "restaurant", default: ""
    t.float "longitude"
    t.float "latitude"
    t.string "address", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address", "latitude", "longitude"], name: "index_posts_on_address_and_latitude_and_longitude"
  end

  create_table "posts_foods", force: :cascade do |t|
    t.integer "food_id"
    t.integer "post_id"
    t.index ["food_id"], name: "index_posts_foods_on_food_id"
    t.index ["post_id"], name: "index_posts_foods_on_post_id"
  end

  create_table "posts_images", force: :cascade do |t|
    t.integer "image_id"
    t.integer "post_id"
    t.index ["image_id"], name: "index_posts_images_on_image_id"
    t.index ["post_id"], name: "index_posts_images_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "intro", default: ""
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.float "longitude"
    t.float "latitude"
    t.integer "sex", default: 0
    t.string "avatar", default: ""
    t.string "cover", default: ""
    t.date "date_of_birth"
    t.index ["address", "name", "latitude", "longitude"], name: "index_users_on_address_and_name_and_latitude_and_longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
