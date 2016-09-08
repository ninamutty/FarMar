# lib/Sale.rb - Sale class
require_relative '../far_mar.rb'

class FarMar::Sale < FarMar::Base
    attr_reader :sale_id, :sale_amount, :purchase_time, :vendor_id, :product_id


    def initialize(sale_hash)
        @sale_id = sale_hash[:sale_id]
        @sale_amount = sale_hash[:sale_amount]
        @purchase_time = DateTime.strptime(sale_hash[:purchase_time], '%Y-%m-%d %H:%M:%S %z')
        @vendor_id = sale_hash[:vendor_id]
        @product_id = sale_hash[:product_id]
    end



    def self.all(information = "support/sales.csv")
        super
    end


    def vendor
        FarMar::Vendor.find(@vendor_id)
    end

    def product
        FarMar::Product.find(@product_id)
    end

    def self.between(beginning_time, end_time)
        sales_between_array = []
        first_datetime = DateTime.strptime(beginning_time, '%Y-%m-%d %H:%M:%S %z')
        second_datetime = DateTime.strptime(end_time, '%Y-%m-%d %H:%M:%S %z')

        all.each_value do |sale|
            sales_between_array << sale if (sale.purchase_time >= first_datetime) && (sale.purchase_time <= second_datetime) 
        end
        return sales_between_array
    end

end


#ap FarMar::Sale.find(30).purchase_time.class
# ap FarMar::Sale.find(40).purchase_time
#
# ap FarMar::Sale.find(30).purchase_time > FarMar::Sale.find(40).purchase_time

# all_sales = FarMar::Sale.all
# ap all_sales[5].class

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
