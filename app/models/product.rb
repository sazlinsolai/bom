class Product < ActiveRecord::Base
  
  has_many :billmaterials
  has_one :product_info
  
  
end
