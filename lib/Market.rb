# lib/Market.rb - Market class
require_relative '../far_mar.rb'
require_relative 'Vendor'
require 'awesome_print'

class FarMar::Market < FarMar::Base
    attr_reader :vendor_array, :all_info, :market_id, :market_name, :market_address, :city, :county, :state, :zip

    def initialize(new_market_hash)
        @market_id = new_market_hash[:market_id]
        @market_name = new_market_hash[:market_name]
        @market_address = new_market_hash[:market_address]
        @city = new_market_hash[:city]
        @county = new_market_hash[:county]
        @state = new_market_hash[:state]
        @zip = new_market_hash[:zip]
        @vendor_array = []
    end

    ### Imports the data from the CSV file and creats new instances of each of them - then puts them into an array
    def self.all(information = "support/markets.csv")
        super
    end


    def vendors
        FarMar::Vendor.all.each_value do |vendor|
            @vendor_array << vendor if vendor.market_id == @market_id
        end
        return @vendor_array
    end
end


#ap FarMar::Vendor.find(20).class
# instance = FarMar::Market.find(60)
# # ap instance.class
# # ap instance.market_id
# ap instance.vendors


#ap FarMar::Market.all

#market = FarMar::Market.find(300)
#ap market = FarMar::Market.new(FarMar::Market.find(300))

# all_markets = FarMar::Market.all
# ap all_markets[3].class
# ap FarMar::Market.find(1)

# ap FarMar::Market.all[340] #-- zip is a nil value
# ap FarMar::Market.find(340)













# @market_id = new_market_hash[:market_id]
# @name = new_market_hash[:name]
# @address = new_market_hash[:address]
# @city = new_market_hash[:city]
# @county = new_market_hash[:county]
# @state = new_market_hash[:state]
# @zip = new_market_hash[:zip]
# @class_info = {}



# def self.gets_csv_info
#     CSV.open("support/markets.csv", 'r').each do |market|
#         id = market[0]
#         name = market[1]
#         address = market[2]
#         city = market[3]
#         county = market[4]
#         state = market[5]
#         zip = market[6]
#
#         new_market = {market_id: id, name: name, address: address, city: city, county: county, state: state, zip: zip}
#         @class_info[id] = FarMar::Market.new(new_market)
#     end
# end
