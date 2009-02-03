class RenameColumnStampingLocationIdToStampingLocation < ActiveRecord::Migration
  def self.up
    rename_column :product_infos, :stamping_location_id, :stamping_location
  end

  def self.down
    rename_column :product_infos, :stamping_location, :stamping_location_id
  end
end
