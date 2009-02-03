class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :product_name
      t.string :product_no
      t.string :product_desc
      t.string :product_type
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
