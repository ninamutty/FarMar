# lib/Product.rb - Product class
require_relative '../far_mar.rb'

class FarMar::Product < FarMar::Base
    attr_reader :product_id, :product_name, :vendor_id, :vendor_array

    def initialize(product_hash)
        @product_id = product_hash[:product_id]
        @product_name = product_hash[:product_name]
        @vendor_id = product_hash[:vendor_id]
    end

    def self.all(information = "support/products.csv")
        super
    end

    def vendor
        FarMar::Vendor.find(@vendor_id)
    end

    def sales
        sales_array = []
        FarMar::Sale.all.each_value do |sale|
            sales_array << sale if sale.product_id == @product_id
        end
        return sales_array
    end

    def number_of_sales
        sales.length     ### Is it better to call sales inside this (where you may have to reload all of the files - or to use the @sales_array?)
    end

    def self.by_vendor(given_vendor_id)
        vendor_products_array = []
        all.each_value do |product|
            vendor_products_array << product if product.vendor_id == given_vendor_id
        end
        return vendor_products_array
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
