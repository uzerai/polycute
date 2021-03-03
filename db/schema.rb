# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_142151) do

  create_table "functionalities", force: :cascade do |t|
    t.string "uuid", default: "36e3ba2d-9c19-4d8c-8060-1713a5b395aa", null: false
    t.string "name", null: false
    t.string "route", null: false
    t.json "variable_object", null: false
    t.json "function_definition", null: false
    t.json "registration_payload", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_functionalities_on_uuid"
  end

end
