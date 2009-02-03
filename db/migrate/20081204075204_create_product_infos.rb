class CreateProductInfos < ActiveRecord::Migration
  def self.up
    create_table :product_infos do |t|
      t.string :dwg_no, :limit => 50
      t.string :PCO_no, :limit => 50
      t.string :specification, :limit => 50
      t.string :streatment_specs, :limit => 50
      t.decimal :blanking_t, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :blanking_w, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :blanking_l, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :pitch, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :gross_weight, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :nett_weight, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :scrap_weight, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.decimal :qty_strip, :precision => 9, :scale => 2, :null => false, :default => 0.00
      t.integer :stamping_location_id
      t.integer :childpart_location_id
      t.integer :assy_location_id
      t.integer :streatment_location_id
      t.integer :product_id
      t.timestamps
    end
  end

  def self.down
    drop_table :product_infos
  end
end
