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

ActiveRecord::Schema.define(:version => 20090803074209) do

  create_table "accomm_contains", :force => true do |t|
    t.integer  "contained_in_id"
    t.integer  "contained_item_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accomm_types", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "total"
  end

  create_table "accomms", :force => true do |t|
    t.integer "booking_id"
    t.integer "accomm_type_id"
    t.integer "accomm_quantity"
  end

  create_table "bookings", :force => true do |t|
    t.date     "arrival_date"
    t.date     "departure_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  create_table "statuses", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

end
