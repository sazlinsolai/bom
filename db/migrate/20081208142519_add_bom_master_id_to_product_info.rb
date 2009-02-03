class AddBomMasterIdToProductInfo < ActiveRecord::Migration
  def self.up
     add_column :product_infos, :bom_master_id, :integer
  end

  def self.down
     remove_column :product_infos, :bom_master_id
  end
end
