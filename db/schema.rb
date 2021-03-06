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

ActiveRecord::Schema.define(version: 20161202083021) do

  create_table "grad_years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grad_years_photos", id: false, force: :cascade do |t|
    t.integer "grad_year_id", null: false
    t.integer "photo_id",     null: false
  end

  create_table "graduates", force: :cascade do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.integer  "grad_year_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "x"
    t.integer  "x2"
    t.integer  "y"
    t.integer  "y2"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "filepath"
    t.string   "resolution"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
