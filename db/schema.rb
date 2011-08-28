# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110827201144) do

  create_table "category_element_associations", :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "element_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "second_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_parent",        :default => false, :null => false
    t.boolean  "show_root",          :default => true,  :null => false
  end

  create_table "languages", :force => true do |t|
    t.string  "title",                   :limit => 100,                    :null => false
    t.string  "code",                    :limit => 3,                      :null => false
    t.string  "locale",                  :limit => 6,                      :null => false
    t.integer "unicode_codepoint_start"
    t.integer "unicode_codepoint_end"
    t.boolean "use_for_interface",                      :default => false, :null => false
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url", :null => false
    t.string  "salt",       :null => false
  end

  create_table "people", :force => true do |t|
    t.string "fullname", :null => false
  end

  add_index "people", ["fullname"], :name => "index_people_on_fullname", :unique => true

  create_table "permissions", :force => true do |t|
    t.string "title",       :limit => 60, :null => false
    t.text   "description"
  end

  add_index "permissions", ["title"], :name => "index_permissions_on_title", :unique => true

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "permission_id", :null => false
    t.integer "role_id",       :null => false
  end

  add_index "permissions_roles", ["permission_id", "role_id"], :name => "index_permissions_roles_on_permission_id_and_role_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string "title",       :limit => 20, :null => false
    t.text   "description"
  end

  add_index "roles", ["title"], :name => "index_roles_on_title", :unique => true

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.string   "login",                     :limit => 80, :null => false
    t.string   "crypted_password",          :limit => 40, :null => false
    t.string   "email"
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "identity_url"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
