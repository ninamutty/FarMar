##MODULE

# gems your project needs
require 'csv'
require 'awesome_print'
require 'chronic'

# our namespace module
module FarMar
    class Base
        attr_reader :vendor_id, :name, :num_of_employees, :market_id, :vendor_hash, :all_info, :file_info
        def initialize(hash)
            #@all_info = nil
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
