##MODULE

# gems your project needs
require 'csv'
require 'awesome_print'
require 'chronic'

# our namespace module
module FarMar
    class Base
        attr_reader :vendor_id, :name, :num_of_employees, :market_id, :vendor_hash, :all_info, :file_info, :all_markets, :all_vendors, :all_products, :all_sales

        def initialize(hash)
            @all_markets
            @all_vendors
            @all_products
            @all_sales
        end

        CSV::Converters[:blank_to_nil] = lambda do |field|
          field && field.empty? ? nil : field
        end


        def self.all(all_variable= @all_markets)
            return all_variable ||= gets_csv_info   #### This will only read the file in if the variable that stores the information for each spread sheet is falsey - aka the first time - after that it will just return the already stored variable!
        end


        def self.find(id_num)
            raise ArgumentError if id_num.class != Fixnum
            ## searches hash for an id number
            return all[id_num]
        end



        private
        def self.gets_csv_info(filename= "support/markets.csv", variable_to_store= @all_markets)
            file_info = {}
            objects_hash = {}


            ##This reads in a blank file
            CSV.foreach(filename, {:headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil]}) do |row|
                file_info[row[0]] = row
            end

            ## this takes the info file and reads loops through each key/value pair to turn them in to instances of the class they are being called on
            file_info.each do |key, value|
                objects_hash[key] = self.new(value)
            end
            variable_to_store = objects_hash
            return variable_to_store
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
