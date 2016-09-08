# lib/Vendor.rb - Vendor class
require_relative '../far_mar.rb'
require_relative 'Market'
require_relative 'Sale'
require_relative 'Product'
require 'awesome_print'

class FarMar::Vendor < FarMar::Base
    attr_reader :vendor_id, :name, :num_of_employees, :market_id, :vendor_hash, :class_info, :sales_array, :products_array

    def initialize(vendor_hash)
        @vendor_id = vendor_hash[:vendor_id]
        @vendor_name = vendor_hash[:vendor_name]
        @num_of_employees = vendor_hash[:num_of_employees]
        @market_id = vendor_hash[:market_id]
    end

    def self.all(information = "support/vendors.csv")
        super
    end

    #returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor
    def markets
        FarMar::Market.find(@market_id)
    end

    #returns a collection of FarMar::Product instances that are associated by the FarMar::Productvendor_id field.
    def products
        @products_array = []
        FarMar::Product.all.each_value do |product|
            @products_array << product if product.vendor_id == @vendor_id
        end
        return @products_array
    end

    #returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    def sales
        @sales_array = []
        FarMar::Sale.all.each_value do |sale|
            @sales_array << sale if sale.vendor_id == @vendor_id
        end
        return @sales_array
    end

    #returns the the sum of all of the vendor's sales (in cents)
    def revenue
        total = 0
        sales.each {|sale| total += sale.sale_amount}
        puts "My total is #{total}"
        return total
    end

    #returns all of the vendors with the given market_id (see FarMar::Market.find(id))
    def self.by_market(give_market_id)
        market_vendors_array = []
        all.each_value do |vendor|
            market_vendors_array << vendor if vendor.market_id == give_market_id
        end
        return market_vendors_array
    end
end




# vendor = FarMar::Vendor.find(15)
# ap vendor.market_id.class

# ap vendor.sales
# ap vendor.revenue

# vendor = FarMar::Vendor.find(20)
# ap vendor.market_id

# ap all_vendors[5]





# #ap FarMar::Vendor.gets_csv_info
# ap FarMar::Vendor.all
# ap FarMar::Vendor.find(20)






# def initialize(vendor_hash)
#     @vendor_id = vendor_hash[:vendor_id]
#     @name = vendor_hash[:name]
#     @num_of_employees = vendor_hash[:num_of_employees]
#     @market_id = vendor_hash[:market_id]
# end
