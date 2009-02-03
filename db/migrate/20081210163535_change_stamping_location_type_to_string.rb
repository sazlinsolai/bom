class ChangeStampingLocationTypeToString < ActiveRecord::Migration
  def self.up
    change_column :product_infos, :stamping_location, :string, :limit => 100
  end

  def self.down
    change_column :product_infos, :stamping_location, :integer
  end
end
