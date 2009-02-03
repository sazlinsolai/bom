class AddBomMasterToBillmaterial < ActiveRecord::Migration
  def self.up
    add_column :billmaterials, :bom_master, :string
  end

  def self.down
    remove_column :billmaterials, :bom_master
  end
end
