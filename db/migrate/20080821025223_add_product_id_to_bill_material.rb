class AddProductIdToBillMaterial < ActiveRecord::Migration
  def self.up
    add_column :billmaterials, :product_id, :integer
  end

  def self.down
    remove_column :billmaterials, :product_id
  end
end
