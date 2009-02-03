class Billmaterial < ActiveRecord::Base

  belongs_to :product
  
  acts_as_tree
  validates_presence_of :bill_name
  attr_accessor :style
  
  def self.roots
    self.find(:all, :conditions=>["parent_id = ?", 0])
  end
  
  def level
    self.ancestors.size
  end
end
