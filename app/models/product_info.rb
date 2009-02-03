class ProductInfo < ActiveRecord::Base
  
  belongs_to :product
  
  has_many :organizations
  
end
