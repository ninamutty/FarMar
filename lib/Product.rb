# lib/Product.rb - Product class
require_relative '../far_mar.rb'

class FarMar::Product < FarMar::Base
    attr_reader :product_id, :product_name, :vendor_id, :vendor_array

    def initialize(product_hash)
        @product_id = product_hash[:product_id]
        @product_name = product_hash[:product_name]
        @vendor_id = product_hash[:vendor_id]
        #@vendor_array =
    end

    def self.all(information = "support/products.csv")
        super
    end


    def vendor
    end

    def sales
    end

    def number_of_sales
    end

    def self.by_vendor(vendor_id)
    end
end

# all_products = FarMar::Product.all
# ap all_products[5].class






# ap FarMar::Product.find(3)








# def self.gets_csv_info
#     ### Read in products data files ###
#     CSV.open("support/products.csv", 'r').each do |product|
#         id = product[0]
#         name = product[1]
#         vendor_id = product[2]
#
#         new_product = {product_id: id, name: name, vendor_id: vendor_id}
#         @class_info[id] = FarMar::Product.new(new_product)
#     end
# end
