# lib/Product.rb - Product class
#require_relative '../far_mar.rb'

class FarMar::Product
    attr_reader :product_id, :name, :vendor_id, :class_info

    def initialize(product_hash)
        @id = product_hash[:product_id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
        @class_info = {}
    end

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

    def self.all
    end

    def self.find(id)
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

#FarMar::Product.gets_csv_info
