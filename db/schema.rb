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

ActiveRecord::Schema.define(version: 20161130054537) do

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                    default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.date     "dob"
    t.string   "gender"
    t.string   "language_one"
    t.string   "language_two"
    t.string   "height"
    t.integer  "age"
    t.string   "shirt_size"
    t.string   "dress_size"
    t.integer  "pant_size"
    t.integer  "shoe_size"
    t.string   "website"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "phone_number"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "photo_one_file_name"
    t.string   "photo_one_content_type"
    t.integer  "photo_one_file_size"
    t.datetime "photo_one_updated_at"
    t.string   "photo_two_file_name"
    t.string   "photo_two_content_type"
    t.integer  "photo_two_file_size"
    t.datetime "photo_two_updated_at"
    t.string   "photo_three_file_name"
    t.string   "photo_three_content_type"
    t.integer  "photo_three_file_size"
    t.datetime "photo_three_updated_at"
    t.string   "photo_four_file_name"
    t.string   "photo_four_content_type"
    t.integer  "photo_four_file_size"
    t.datetime "photo_four_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "username"
  end

end
