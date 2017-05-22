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

ActiveRecord::Schema.define(version: 20170522192420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "remote_trigger_id"
    t.string "branch", null: false
    t.string "commit", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "failed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_builds_on_project_id"
  end

  create_table "project_owners", force: :cascade do |t|
    t.string "type", null: false
    t.string "remote_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "remote_id"], name: "index_project_owners_on_type_and_remote_id", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.integer "project_owner_id", null: false
    t.string "type", null: false
    t.string "remote_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_owner_id"], name: "index_projects_on_project_owner_id"
    t.index ["type", "remote_id"], name: "index_projects_on_type_and_remote_id", unique: true
  end

end
