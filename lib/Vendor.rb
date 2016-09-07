# lib/Vendor.rb - Vendor class
#require_relative '../far_mar.rb'
require 'awesome_print'

class FarMar::Vendor < FarMar::Base
    attr_reader :vendor_id, :name, :num_of_employees, :market_id, :vendor_hash, :class_info

    # @class_info = {}
    def initialize(vendor_hash)
        @vendor_id = vendor_hash[:vendor_id]
        @name = vendor_hash[:name]
        @num_of_employees = vendor_hash[:num_of_employees]
        @market_id = vendor_hash[:market_id]
    end

    def self.all
        super
    end

    def self.find(id)
    end

    def markets
    end

    def products
    end

    def sales
    end

    def revenue
    end

    def self.by_market(market_id)
    end
end


#ap FarMar::Vendor.gets_csv_info
#ap FarMar::Vendor.all
