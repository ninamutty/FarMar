# lib/Product.rb - Product class
require_relative '../far_mar.rb'

class FarMar::Product < FarMar::Base
    attr_reader :product_id, :product_name, :vendor_id, :vendor_array #, :all_products

    def initialize(product_hash)
        @product_id = product_hash[:product_id]
        @product_name = product_hash[:product_name]
        @vendor_id = product_hash[:vendor_id]
        #@all_products
    end


    def self.gets_csv_info(information = "support/products.csv", variable_to_store = @all_products)
        super
    end

    def self.all(all_variable= @all_products)
        super
    end

    def vendor
        #FarMar::Vendor.gets_csv_info
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


# ap FarMar::Product.all

# all_products = FarMar::Product.all
# ap all_products[5].class
