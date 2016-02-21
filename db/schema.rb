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

ActiveRecord::Schema.define(version: 20160221182827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_scenes", force: :cascade do |t|
    t.integer  "scene_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_scenes", ["list_id"], name: "index_list_scenes_on_list_id", using: :btree
  add_index "list_scenes", ["scene_id"], name: "index_list_scenes_on_scene_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.string   "locations"
    t.string   "title"
    t.string   "writer"
    t.string   "director"
    t.string   "release_year"
    t.string   "production_company"
    t.string   "actor_1"
    t.string   "actor_2"
    t.string   "actor_3"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "description"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "list_scenes", "lists"
  add_foreign_key "list_scenes", "scenes"
  add_foreign_key "lists", "users"
end
