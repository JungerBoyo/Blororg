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

ActiveRecord::Schema[7.0].define(version: 2023_05_07_202132) do
  create_table "attachment_proxies", force: :cascade do |t|
    t.string "name"
    t.integer "type"
    t.string "attachable_type", null: false
    t.integer "attachable_id", null: false
    t.integer "attachment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachment_proxies_on_attachable"
    t.index ["attachment_id"], name: "index_attachment_proxies_on_attachment_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.binary "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "contents"
    t.integer "karma"
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", limit: 128
    t.string "contents"
    t.integer "category_id", null: false
    t.integer "karma"
    t.boolean "is_private"
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_tags_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nick", limit: 50
    t.string "emial", limit: 50
    t.string "description"
    t.string "password_hash"
    t.string "private_context_password_hash"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin"], name: "index_users_on_admin"
    t.index ["emial"], name: "index_users_on_emial", unique: true
    t.index ["nick"], name: "index_users_on_nick", unique: true
  end

  add_foreign_key "attachment_proxies", "attachments"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "authors"
  add_foreign_key "posts", "categories"
  add_foreign_key "tags", "posts"
end
