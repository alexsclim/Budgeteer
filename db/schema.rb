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

ActiveRecord::Schema.define(version: 20160417025448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string   "title"
    t.decimal  "balance"
    t.decimal  "allocated_balance"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "food"
    t.decimal  "housing"
    t.decimal  "utilities"
    t.decimal  "transportation"
    t.decimal  "health"
    t.decimal  "clothing"
    t.decimal  "education"
    t.decimal  "fitness"
    t.decimal  "electronics"
    t.decimal  "other"
    t.decimal  "allocated_food"
    t.decimal  "allocated_housing"
    t.decimal  "allocated_utilities"
    t.decimal  "allocated_transportation"
    t.decimal  "allocated_health"
    t.decimal  "allocated_clothing"
    t.decimal  "allocated_education"
    t.decimal  "allocated_fitness"
    t.decimal  "allocated_electronics"
    t.decimal  "allocated_other"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.decimal  "balance"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
