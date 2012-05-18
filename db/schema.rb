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

ActiveRecord::Schema.define(:version => 20120517102821) do

  create_table "addresses", :primary_key => "address_id", :force => true do |t|
    t.string   "first_name",    :limit => 32,  :default => "", :null => false
    t.string   "last_name",     :limit => 32,  :default => "", :null => false
    t.string   "address_1",     :limit => 128,                 :null => false
    t.string   "address_2",     :limit => 128
    t.string   "postal_code",   :limit => 10,  :default => "", :null => false
    t.string   "city",          :limit => 128,                 :null => false
    t.string   "phone",         :limit => 32
    t.integer  "created_by",                   :default => 0,  :null => false
    t.datetime "created_date",                                 :null => false
    t.integer  "modified_by",                  :default => 0,  :null => false
    t.datetime "modified_date",                                :null => false
  end

  add_index "addresses", ["postal_code", "city", "first_name", "last_name", "address_2", "address_1"], :name => "idx_address_fields"

  create_table "customers", :primary_key => "customer_id", :force => true do |t|
    t.string   "first_name",    :limit => 32, :default => "",       :null => false
    t.string   "last_name",     :limit => 32, :default => "",       :null => false
    t.string   "email_address", :limit => 96, :default => "",       :null => false
    t.string   "postal_code",   :limit => 10, :default => "",       :null => false
    t.string   "password",      :limit => 32, :default => "",       :null => false
    t.string   "status",        :limit => 20, :default => "ACTIVE", :null => false
    t.datetime "date_added",                                        :null => false
    t.integer  "created_by",                  :default => 0,        :null => false
    t.datetime "created_date",                                      :null => false
    t.integer  "modified_by",                 :default => 0,        :null => false
    t.datetime "modified_date",                                     :null => false
    t.boolean  "is_deleted",                  :default => false,    :null => false
  end

  add_index "customers", ["email_address"], :name => "idx_email"
  add_index "customers", ["email_address"], :name => "uk_email", :unique => true

  create_table "email_preferences", :primary_key => "customer_id", :force => true do |t|
    t.boolean  "subscribes_to_daily_emails",    :default => false, :null => false
    t.boolean  "subscribes_to_special_promos",  :default => false, :null => false
    t.boolean  "subscribes_to_weekly_calendar", :default => false, :null => false
    t.integer  "created_by",                    :default => 0,     :null => false
    t.datetime "created_date",                                     :null => false
    t.integer  "modified_by",                   :default => 0,     :null => false
    t.datetime "modified_date",                                    :null => false
    t.boolean  "is_deleted",                    :default => false, :null => false
  end

  create_table "orders", :primary_key => "order_id", :force => true do |t|
    t.integer  "customer_id",                                                                                 :null => false
    t.string   "first_name",          :limit => 32
    t.string   "last_name",           :limit => 32
    t.string   "email_address",       :limit => 96,                               :default => "",             :null => false
    t.integer  "shipping_address_id"
    t.integer  "payment_method_id"
    t.decimal  "total_amount",                      :precision => 8, :scale => 2, :default => 0.0,            :null => false
    t.decimal  "tax_amount",                        :precision => 8, :scale => 2, :default => 0.0,            :null => false
    t.decimal  "gift_card_amount",                  :precision => 8, :scale => 2
    t.decimal  "shipping_amount",                   :precision => 8, :scale => 2
    t.decimal  "handling_amount",                   :precision => 8, :scale => 2
    t.datetime "order_date",                                                                                  :null => false
    t.datetime "submitted_date"
    t.string   "status",              :limit => 16,                               :default => "AUTH_PENDING", :null => false
    t.integer  "created_by",                                                      :default => 0,              :null => false
    t.datetime "created_date",                                                                                :null => false
    t.integer  "modified_by",                                                     :default => 0,              :null => false
    t.datetime "modified_date",                                                                               :null => false
    t.boolean  "is_deleted",                                                      :default => false,          :null => false
  end

  add_index "orders", ["customer_id"], :name => "idx_customer_id"
  add_index "orders", ["shipping_address_id"], :name => "idx_shipping_address_id"

  create_table "queries", :force => true do |t|
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_email"
    t.integer  "order_id"
    t.datetime "order_min_date"
    t.datetime "order_max_date"
    t.boolean  "order_is_deleted"
    t.decimal  "min_total_amount",    :precision => 10, :scale => 0
    t.decimal  "max_total_amount",    :precision => 10, :scale => 0
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
