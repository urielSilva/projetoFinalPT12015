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

ActiveRecord::Schema.define(version: 20150704141441) do

  create_table "agendas", force: :cascade do |t|
    t.string   "agenda_name",        limit: 255
    t.string   "agenda_description", limit: 255
    t.date     "agenda_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "functions", force: :cascade do |t|
    t.string   "function_name",   limit: 255
    t.string   "function_module", limit: 255
    t.string   "function_url",    limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "job_has_functions", force: :cascade do |t|
    t.integer  "job_id",      limit: 4
    t.integer  "function_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "job_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "meeting_has_members", force: :cascade do |t|
    t.integer  "meeting_id",        limit: 4
    t.integer  "member_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "meeting_mandatory", limit: 4
    t.integer  "meeting_presence",  limit: 4
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "meeting_name",        limit: 255
    t.string   "meeting_description", limit: 255
    t.date     "meeting_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "agenda_id",           limit: 4
    t.integer  "meeting_creator",     limit: 4
  end

  create_table "members", force: :cascade do |t|
    t.string   "member_name",     limit: 255
    t.string   "member_email",    limit: 255
    t.string   "member_password", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "job_id",          limit: 4
    t.boolean  "admin",           limit: 1,   default: false
  end

end
