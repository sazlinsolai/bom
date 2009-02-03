class AddBomMasterIdToBillmaterial < ActiveRecord::Migration
  def self.up
    add_column :billmaterials, :bom_master_id, :integer
  end

  def self.down
    remove_column :billmaterials, :bom_master_id
  end
end
