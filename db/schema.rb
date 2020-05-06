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

ActiveRecord::Schema.define(version: 2020_05_06_003115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "open_answers", force: :cascade do |t|
    t.text "content"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_open_answers_on_question_id"
  end

  create_table "poll_answers", force: :cascade do |t|
    t.text "content"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_poll_answers_on_question_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.integer "question_type"
    t.bigint "poll_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_questions_on_poll_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "poll_answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.index ["poll_answer_id"], name: "index_user_answers_on_poll_answer_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id"
  end

  add_foreign_key "open_answers", "questions"
  add_foreign_key "poll_answers", "questions"
  add_foreign_key "questions", "polls"
  add_foreign_key "user_answers", "poll_answers"
  add_foreign_key "user_answers", "questions"
end
