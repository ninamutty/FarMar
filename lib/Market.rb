# lib/Market.rb - Market class
require_relative '../far_mar.rb'
require_relative 'Vendor'
require 'awesome_print'

class FarMar::Market < FarMar::Base
    attr_reader :vendor_array, :all_info, :market_id, :market_name, :market_address, :city, :county, :state, :zip #, :all_markets

    def initialize(new_market_hash)
        @market_id = new_market_hash[:market_id]
        @market_name = new_market_hash[:market_name]
        @market_address = new_market_hash[:market_address]
        @city = new_market_hash[:city]
        @county = new_market_hash[:county]
        @state = new_market_hash[:state]
        @zip = new_market_hash[:zip]
        @vendor_array = []
        #@all_markets
    end

    ### Imports the data from the CSV file and creats new instances of each of them - then puts them into a hash
    def self.gets_csv_info(information = "support/markets.csv", variable_to_store = @all_markets)
        super
    end

    def self.all(all_variable= @all_markets)
        super
    end

    #returns a collection of FarMar::Vendor instances that are associated with the market by themarket_id field.
    def vendors
        #FarMar::Vendor.gets_csv_info
        FarMar::Vendor.all.each_value do |vendor|
            @vendor_array << vendor if vendor.market_id == @market_id
        end
        return @vendor_array
    end
end




# ap FarMar::Market.all

#ap FarMar::Vendor.find(20).class
# instance = FarMar::Market.find(60)
# # ap instance.class
# # ap instance.market_id
# ap instance.vendors
