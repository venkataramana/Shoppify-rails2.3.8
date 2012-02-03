class Product < ActiveRecord::Base
        belongs_to :category
         has_attached_file :kvr, :styles => { :medium => "700x400#", :thumb => "100x100#" }
         def self.vankat(product_id)
                  Product.find(product_id)
        end
end

