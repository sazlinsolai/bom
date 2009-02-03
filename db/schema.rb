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

ActiveRecord::Schema.define(:version => 20081210163535) do

  create_table "billmaterials", :force => true do |t|
    t.string   "bill_name"
    t.string   "bill_no"
    t.string   "bill_desc"
    t.string   "bill_date"
    t.string   "bill_gate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bom_product_id", :limit => 11
    t.integer  "product_id",     :limit => 11
    t.string   "bom_master"
    t.integer  "bom_master_id",  :limit => 11
    t.integer  "parent_id",      :limit => 11
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_infos", :force => true do |t|
    t.string   "dwg_no",                 :limit => 50
    t.string   "PCO_no",                 :limit => 50
    t.string   "specification",          :limit => 50
    t.string   "streatment_specs",       :limit => 50
    t.decimal  "blanking_t",                            :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "blanking_w",                            :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "blanking_l",                            :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "pitch",                                 :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "gross_weight",                          :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "nett_weight",                           :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "scrap_weight",                          :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.decimal  "qty_strip",                             :precision => 9, :scale => 2, :default => 0.0, :null => false
    t.string   "stamping_location",      :limit => 100
    t.integer  "childpart_location_id",  :limit => 11
    t.integer  "assy_location_id",       :limit => 11
    t.integer  "streatment_location_id", :limit => 11
    t.integer  "product_id",             :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bom_master_id",          :limit => 11
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.string   "product_no"
    t.string   "product_desc"
    t.string   "product_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
