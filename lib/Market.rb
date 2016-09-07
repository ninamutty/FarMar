# lib/Market.rb - Market class
require_relative '../far_mar.rb'


class FarMar::Market < FarMar::Base
    attr_reader :market_id, :name, :address, :city, :county, :state, :zip, :market_hash, :class_info

    def initialize #(new_market_hash)
    end

    def self.all(information = "support/markets.csv")
        super
    end


    def vendors
    end
end

#
# ap FarMar::Market.all
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
