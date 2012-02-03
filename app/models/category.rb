class Category < ActiveRecord::Base
        has_many :products ,:dependent => :destroy
        has_attached_file :cat, :styles => { :medium => "400x150#", :thumb => "100x100#" }

end

