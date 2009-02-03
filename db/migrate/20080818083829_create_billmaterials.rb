class CreateBillmaterials < ActiveRecord::Migration
  def self.up
    create_table :billmaterials do |t|
      t.string :bill_name
      t.string :bill_no
      t.string :bill_desc
      t.string :bill_date
      t.string :bill_gate
      t.timestamps
      t.integer :bom_product_id
    end
  end

  def self.down
    drop_table :billmaterials
  end
end
