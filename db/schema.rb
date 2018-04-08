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

ActiveRecord::Schema.define(version: 20180118010433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "code"
    t.string "unique"
    t.text "description"
    t.bigint "role_id"
    t.bigint "piece_id"
    t.bigint "size_id"
    t.index ["piece_id"], name: "index_codes_on_piece_id"
    t.index ["role_id"], name: "index_codes_on_role_id"
    t.index ["size_id"], name: "index_codes_on_size_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "gender"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "title"
    t.string "gender"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.string "detail"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.string "gender"
    t.integer "local"
    t.string "position"
    t.string "w_qf_apron"
    t.string "m_qf_apron"
    t.string "w_vmf_apron"
    t.string "m_vmf_apron"
    t.string "w_shirt"
    t.string "m_shirt"
    t.string "m_blue_trouser"
    t.string "w_blue_trouser"
    t.string "m_black_trouser"
    t.string "w_black_trouser"
    t.string "nativa_trouser"
    t.string "beauty_trouser"
    t.string "m_blue_polar"
    t.string "w_blue_polar"
    t.string "nativa_polar"
    t.string "m_black_polar"
    t.string "w_black_polar"
    t.string "m_red_t_shirt"
    t.string "w_red_t_shirt"
    t.string "beauty_jacket"
    t.string "beauty_polar"
    t.string "yellow_t_shirt"
    t.string "blue_tie"
    t.string "red_tie"
    t.string "m_cargo_trouser"
    t.string "m_gray_t_shirt"
    t.string "w_cargo_trouser"
    t.string "w_gray_t_shirt"
    t.string "m_black_t_shirt"
    t.string "w_black_t_shirt"
    t.boolean "answered", default: false
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
