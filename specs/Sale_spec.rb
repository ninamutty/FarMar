require_relative 'spec_helper'
require_relative '../lib/Sale'

# vendor	Instance	returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field

# product	Instance	returns the FarMar::Product instance that is associated with this sale using the FarMar::Saleproduct_id field

# self.between(beginning_time, end_time)	Class	returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

describe 'testing vendor instance method' do
    let (:sale_instance) {FarMar::Sale.find(67)}

    it 'must return a vendor instance' do
        expect (sale_instance.vendor).must_be_kind_of FarMar::Vendor
    end

    it 'must search for the instance of vendor that has a vendor_id equal to the vendor_id of the sale instance' do
        sale_instance.vendor.vendor_id.must_equal (FarMar::Vendor.find(sale_instance.vendor_id).vendor_id)
    end
end

describe 'testing product instance method' do
    let (:sale_instance) {FarMar::Sale.find(54)}

    it 'must return a product instance' do
        expect (sale_instance.product).must_be_kind_of FarMar::Product
    end

    it 'must search for the instance of the product that has a product_id equal to the product_id of the sale instance' do
        sale_instance.product.product_id.must_equal (FarMar::Product.find(sale_instance.product_id).product_id)
    end
end


describe 'testing self.between(beginning_time, end_time) class method' do
    let (:sales_by_time) {FarMar::Sale.between("2013-11-12 06:03:54 -0800", "2013-11-12 14:38:29 -0800")}

    it 'must return an array of sale instances' do
        expect (sales_by_time).must_be_kind_of Array
        sales_by_time.each {|sale| sale.must_be_kind_of FarMar::Sale}
    end

    it 'must search for instances of sale who have purchase times between the given parameters' do
        time1 = DateTime.strptime("2013-11-12 06:03:54 -0800", '%Y-%m-%d %H:%M:%S %z')
        time2 = DateTime.strptime("2013-11-12 14:38:29 -0800", '%Y-%m-%d %H:%M:%S %z')
        sales_by_time.each {|sale| (sale.purchase_time).must_be :>=, time1}
        sales_by_time.each {|sale| (sale.purchase_time).must_be :<=, time2}
    end
end
