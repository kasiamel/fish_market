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

ActiveRecord::Schema.define(version: 20160812134437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "min_price"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "fish_id"
    t.integer  "timetable_id"
    t.string   "status"
  end

  add_index "offers", ["fish_id"], name: "index_offers_on_fish_id", using: :btree
  add_index "offers", ["timetable_id"], name: "index_offers_on_timetable_id", using: :btree

  create_table "purchase_offers", force: :cascade do |t|
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "user_id"
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchase_offers", ["offer_id"], name: "index_purchase_offers_on_offer_id", using: :btree
  add_index "purchase_offers", ["user_id"], name: "index_purchase_offers_on_user_id", using: :btree

  create_table "timetables", force: :cascade do |t|
    t.string   "day"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "offer_id"
    t.integer  "purchase_offer_id"
    t.integer  "quantity"
    t.integer  "price"
  end

  add_index "transactions", ["offer_id"], name: "index_transactions_on_offer_id", using: :btree
  add_index "transactions", ["purchase_offer_id"], name: "index_transactions_on_purchase_offer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "status"
  end

end
