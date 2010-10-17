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

ActiveRecord::Schema.define(:version => 20091017220317) do

  create_table "image_translations", :force => true do |t|
    t.integer  "image_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_translations", ["image_id"], :name => "index_image_translations_on_image_id"

  create_table "images", :force => true do |t|
    t.text     "description"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "language_translations", :force => true do |t|
    t.integer  "language_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "language_translations", ["language_id"], :name => "index_language_translations_on_language_id"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_translations", :force => true do |t|
    t.integer  "role_id"
    t.string   "locale"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_translations", ["role_id"], :name => "index_role_translations_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_translations", :force => true do |t|
    t.integer  "tag_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_translations", ["tag_id"], :name => "index_tag_translations_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
