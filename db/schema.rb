# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160216163037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string  "title",     null: false
    t.text    "content"
    t.integer "order",     null: false
    t.integer "record_id"
  end

  add_index "chapters", ["order"], name: "index_chapters_on_order", unique: true, using: :btree
  add_index "chapters", ["record_id"], name: "index_chapters_on_record_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string  "name",        null: false
    t.integer "category_id"
  end

  add_index "genres", ["category_id"], name: "index_genres_on_category_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "records_users", id: false, force: :cascade do |t|
    t.integer "record_id"
    t.integer "user_id"
  end

  add_index "records_users", ["record_id", "user_id"], name: "index_records_users_on_record_id_and_user_id", using: :btree
  add_index "records_users", ["user_id"], name: "index_records_users_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "tag", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.string   "alias"
    t.string   "role",                   default: "user", null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chapters", "records"
  add_foreign_key "genres", "categories"
end
