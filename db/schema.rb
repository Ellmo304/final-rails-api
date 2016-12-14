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

ActiveRecord::Schema.define(version: 20161214141227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "garden_id"
    t.date     "date"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_comments_on_garden_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "designs", force: :cascade do |t|
    t.string   "name"
    t.integer  "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_designs_on_garden_id", using: :btree
  end

  create_table "gardens", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "likes",       default: [],              array: true
    t.index ["user_id"], name: "index_gardens_on_user_id", using: :btree
  end

  create_table "gardens_items", id: false, force: :cascade do |t|
    t.integer "garden_id", null: false
    t.integer "item_id",   null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.integer  "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_images_on_garden_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_type"
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.string   "class_type"
    t.integer  "design_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.index ["design_id"], name: "index_tiles_on_design_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
  end

  add_foreign_key "comments", "gardens"
  add_foreign_key "comments", "users"
  add_foreign_key "designs", "gardens"
  add_foreign_key "images", "gardens"
  add_foreign_key "tiles", "designs"
end
