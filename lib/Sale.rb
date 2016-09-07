# lib/Sale.rb - Sale class
require_relative '../far_mar.rb'

class FarMar::Sale < FarMar::Base
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id, :class_info


    def initialize(sale_hash)
        @id = sale_hash[:id]
        @amount = sale_hash[:amount]
        @purchase_time = sale_hash[:purchase_time]
        @vendor_id = sale_hash[:vendor_id]
        @product_id = sale_hash[:product_id]
        @class_info = {}
    end



    def self.all(information = "support/sales.csv")
        super
    end


    def vendor
    end

    def product
    end

    def self.between(beginning_time, end_time)
    end

end
# 
# ap FarMar::Sale.all
# ap FarMar::Sale.find(5)











# def gets_csv_info
#     ### Read in sales data files ###
#     CSV.open("support/sales.csv", 'r').each do |sale|
#         id = sale[0]
#         amount = sale[1]
#         purchase_time = sale[2]
#         vendor_id = sale[3]
#         product_id = sale[4]
#
#         new_sale = {sale_id: id, amount: amount, purchase_time: purchase_time, vendor_id: vendor_id, product_id: product_id}
#         @class_info[id] = FarMar::Sale.new(new_sale)
#     end
# end
