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

ActiveRecord::Schema[7.0].define(version: 2023_09_18_094739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "role", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "name_ar"
    t.string "description"
    t.string "enabled", default: "t"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_users", force: :cascade do |t|
    t.bigint "coupon_id"
    t.bigint "user_id"
    t.bigint "order_id"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_users_on_coupon_id"
    t.index ["order_id"], name: "index_coupon_users_on_order_id"
    t.index ["user_id"], name: "index_coupon_users_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code", null: false
    t.integer "percent", null: false
    t.string "coupon_type"
    t.date "expiry_date"
    t.boolean "enabled", default: true
    t.string "description", default: "", null: false
    t.string "description_ar"
    t.integer "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_products", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_products_on_list_id"
    t.index ["product_id"], name: "index_list_products_on_product_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_ar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "read_at"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_notifications_on_admin_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "quantity", default: 1, null: false
    t.integer "price", default: 0, null: false
    t.integer "orderable_id", null: false
    t.text "orderable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.bigint "order_id"
    t.string "status", null: false
    t.text "comment"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_order_statuses_on_admin_id"
    t.index ["order_id"], name: "index_order_statuses_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.string "status"
    t.boolean "validated", default: false
    t.text "informations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_characteristics", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "characteristic_id"
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_product_characteristics_on_characteristic_id"
    t.index ["product_id"], name: "index_product_characteristics_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "short_description"
    t.text "description", default: "", null: false
    t.text "ingredients"
    t.boolean "enabled", default: true
    t.text "description_ar"
    t.text "tags"
    t.string "reference"
    t.string "original_name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "rating", default: 1
    t.boolean "enabled", default: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wilayas", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_ar"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "category_products", "categories"
  add_foreign_key "category_products", "products"
  add_foreign_key "coupon_users", "coupons"
  add_foreign_key "coupon_users", "orders"
  add_foreign_key "coupon_users", "users"
  add_foreign_key "list_products", "lists"
  add_foreign_key "list_products", "products"
  add_foreign_key "notifications", "admins"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_statuses", "admins"
  add_foreign_key "order_statuses", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "product_characteristics", "characteristics"
  add_foreign_key "product_characteristics", "products"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
