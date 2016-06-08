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

ActiveRecord::Schema.define(version: 20160522114015) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "guests"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "size"
    t.text     "info"
    t.string   "confirmed"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "info"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "guests"
    t.date     "date"
    t.time     "time"
    t.string   "size"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "confirmed"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
