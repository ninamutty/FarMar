##MODULE

# gems your project needs
require 'csv'
require 'awesome_print'

# our namespace module
module FarMar
    class Base
        attr_reader :vendor_id, :name, :num_of_employees, :market_id, :vendor_hash, :all_info

        def initialize
            @all_info = nil
        end

        CSV::Converters[:blank_to_nil] = lambda do |field|
          field && field.empty? ? nil : field
        end

        def self.gets_csv_info(filename)
            file_info = {}
            CSV.foreach(filename, {:headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil]}) do |row|
                file_info[row[0]] = row
            end
            return file_info
        end


        def self.all(information= "support/markets.csv")
            info_hash = {}
            file_info = gets_csv_info(information)
            ## this takes the info file and reads loops through each key/value pair to turn them in to instances of the class they are being called on
            file_info.each do |key, value|
                info_hash[key] = self.new(value)
            end
            return info_hash
            #### shovel self.new(hash_value) and it should be able to tell what class it is that's calling it!
        end

        def self.find(id_num)
            raise ArgumentError if id_num.class != Fixnum
            ## searches hash for an id number
            return all[id_num]
        end

    end
end



# # all of our data classes that live in the module
require_relative 'lib/Market'
require_relative 'lib/Vendor'
require_relative 'lib/Product'
require_relative 'lib/Sale'
# ...require all needed classes

#ap FarMar::Base.gets_csv_info("support/products.csv")
#ap FarMar::Base.all
#ap FarMar::Base.find(300)













        # def initialize(vendor_hash)
        #     @vendor_id = vendor_hash[:id]
        #     @name = vendor_hash[:name]
        #     @num_of_employees = vendor_hash[:num_of_employees]
        #     @market_id = vendor_hash[:market_id]
        # end


        ### This is a working way to read in Vendor CSV
        # def self.gets_csv_vendors
        #     vendor_info = {}
        #     CSV.open("support/vendors.csv", 'r').each do |vendor|
        #         id = vendor[0]
        #         name = vendor[1]
        #         num_of_employees = vendor[2]
        #         market_id = vendor[3]
        #
        #         new_vendor = {id: id, name: name, num_of_employees: num_of_employees, market_id: market_id}
        #         vendor_info[id] = self.new(new_vendor)
        #     end
        #     return vendor_info
        # end


















# @@market_hash = {}
# @@vendor_hash = {}
# @@product_hash = {}
# @@sales_hash = {}
#
# ### Read in markets data files ###
# CSV.open("support/markets.csv", 'r').each do |market|
#     id = market[0]
#     name = market[1]
#     address = market[2]
#     city = market[3]
#     county = market[4]
#     state = market[5]
#     zip = market[6]
#
#     new_market = {market_id: id, name: name, address: address, city: city, county: county, state: state, zip: zip}
#     @@market_hash[id] = FarMar::Market.new(new_market)
# end
#
# ### Read in vendors data files ###
# CSV.open("support/vendors.csv", 'r').each do |vendor|
#     id = vendor[0]
#     name = vendor[1]
#     num_of_employees = vendor[2]
#     market_id = vendor[3]
#
#     new_vendor = {vendor_id: id, name: name, num_of_employees: num_of_employees, market_id: market_id}
#     @@vendor_hash[id] = FarMar::Market.new(new_vendor)
# end
#
# ### Read in products data files ###
# CSV.open("support/products.csv", 'r').each do |product|
#     id = product[0]
#     name = product[1]
#     vendor_id = product[2]
#
#     new_product = {product_id: id, name: name, vendor_id: vendor_id}
#     @@product_hash[id] = FarMar::Market.new(new_product)
# end
#
# ### Read in sales data files ###
# CSV.open("support/sales.csv", 'r').each do |sale|
#     id = sale[0]
#     amount = sale[1]
#     purchase_time = sale[2]
#     vendor_id = sale[3]
#     product_id = sale[4]
#
#     new_sale = {sale_id: id, amount: amount, purchase_time: purchase_time, vendor_id: vendor_id, product_id: product_id}
#     @@market_hash[id] = FarMar::Market.new(new_sale)
# end
