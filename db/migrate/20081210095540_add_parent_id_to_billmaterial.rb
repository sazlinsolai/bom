class AddParentIdToBillmaterial < ActiveRecord::Migration
  def self.up
    add_column :billmaterials, :parent_id, :integer
  end

  def self.down
    remove_column :billmaterials, :parent_id
  end
end
