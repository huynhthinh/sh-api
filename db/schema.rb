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

ActiveRecord::Schema.define(version: 20151214033145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.uuid     "uuid"
    t.string   "name"
    t.integer  "account_type"
    t.string   "email"
    t.string   "domain_name"
    t.string   "contact_person_name"
    t.string   "contact_person_email"
    t.string   "contact_person_phone"
    t.string   "logo"
    t.boolean  "is_deleted",           default: false
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "account_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "accounts", ["account_type"], name: "index_accounts_on_account_type", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "house_number"
    t.string   "house_name"
    t.string   "street_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postcode"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "addresses", ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id", using: :btree

  create_table "admittances", force: :cascade do |t|
    t.boolean  "is_default"
    t.integer  "role_id"
    t.integer  "user_id",    null: false
    t.integer  "tenant_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "scopes"
    t.text     "description"
    t.boolean  "is_standard"
    t.boolean  "is_deleted"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.uuid     "uuid"
    t.string   "name"
    t.string   "email"
    t.string   "domain_name"
    t.string   "contact_person_name"
    t.string   "contact_person_email"
    t.string   "contact_person_phone"
    t.string   "logo"
    t.string   "company_name"
    t.boolean  "is_default",           default: true
    t.boolean  "is_deleted",           default: false
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "account_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "usergroups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_enabled", default: true
    t.boolean  "is_deleted"
    t.integer  "account_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "occupation"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "language"
    t.string   "theme"
    t.string   "locale"
    t.string   "timezone"
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,       null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.json     "tokens"
    t.string   "authentication_token"
    t.datetime "password_updated_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.boolean  "is_enabled"
    t.boolean  "is_deleted"
    t.integer  "account_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", using: :btree

  create_table "users_usergroups", force: :cascade do |t|
    t.integer "usergroup_id"
    t.integer "user_id"
  end

end
