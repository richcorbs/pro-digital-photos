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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130408074054) do

  create_table "pages", :force => true do |t|
    t.boolean  "show_in_nav",         :default => true
    t.boolean  "right_nav",           :default => false
    t.boolean  "is_active",           :default => true
    t.boolean  "is_content_on_top",   :default => true
    t.integer  "product_id"
    t.string   "slug"
    t.string   "title"
    t.string   "display_name"
    t.text     "description"
    t.string   "keywords"
    t.text     "content"
    t.string   "change_frequency"
    t.float    "priority"
    t.integer  "display_order",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "ancestry_depth",      :default => 0
    t.boolean  "display_title",       :default => true
    t.boolean  "display_description", :default => true
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"
  add_index "pages", ["ancestry_depth"], :name => "index_pages_on_ancestry_depth"
  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.string   "image"
    t.string   "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string  "name"
    t.string  "dakis_url"
    t.text    "content"
    t.string  "keywords"
    t.boolean "is_active", :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.boolean  "is_admin",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
