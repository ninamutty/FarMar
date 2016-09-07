# lib/Market.rb - Market class
#require_relative '../far_mar.rb'

module FarMar
class FarMar::Market
    attr_reader :market_id, :name, :address, :city, :county, :state, :zip, :market_hash, :class_info

    def initialize(new_market_hash)
        @market_id = new_market_hash[:market_id]
        @name = new_market_hash[:name]
        @address = new_market_hash[:address]
        @city = new_market_hash[:city]
        @county = new_market_hash[:county]
        @state = new_market_hash[:state]
        @zip = new_market_hash[:zip]
        @class_info = {}
    end

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

    def self.all
    end

    def self.find(id)
    end

    def vendors
    end
end
end

#FarMar::Market.gets_csv_info
