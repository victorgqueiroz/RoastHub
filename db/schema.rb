# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_13_143036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffees", force: :cascade do |t|
    t.string "region"
    t.string "bean"
    t.string "sensory_note"
    t.integer "classification"
    t.string "grinding"
    t.string "brand"
    t.float "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "roast"
    t.index ["user_id"], name: "index_coffees_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coffee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_id"], name: "index_sales_on_coffee_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coffees", "users"
  add_foreign_key "sales", "coffees"
  add_foreign_key "sales", "users"
end

class Coffee < ApplicationRecord
  belongs_to :user

  validates :region, :bean, :sensory_note, :classification, :grinding, :brand, :price, :description, :roast, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :classification, inclusion: { in: 1..5 }
end

class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :coffee

  validates presence: true
end

class User < ApplicationRecord
  has_many :coffees
  has_many :sales

  validates :email, presence: true, uniqueness: true
#  validates :encrypted_password, presence: true
  validates :name, presence: true
end
