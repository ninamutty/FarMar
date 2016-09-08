require_relative 'spec_helper'
require_relative '../lib/Market'

describe 'Tsting self.all' do
    let (:market_info) {FarMar::Market.all("support/markets.csv")}
    let (:vendor_info) {FarMar::Vendor.all("support/vendors.csv")}
    let (:product_info) {FarMar::Product.all("support/products.csv")}
    let (:sale_info) {FarMar::Sale.all("support/sales.csv")}

    it 'must return a hash' do
        expect (FarMar::Market.all("support/markets.csv")).must_be_kind_of Hash
    end

    it 'Must return a collection of all of the instances of the class it is called on' do
        market_info.each_value {|object| object.class.must_equal FarMar::Market}
        vendor_info.each_value {|object| object.class.must_equal FarMar::Vendor}
        product_info.each_value {|object| object.class.must_equal FarMar::Product}
        sale_info.each_value {|object| object.class.must_equal FarMar::Sale}

    end
end

describe 'Testing self.find(id)' do
    let (:sample_market_id) {FarMar::Market.all[340]}
    let (:sample_vendor_id) {FarMar::Vendor.all[50]}
    let (:sample_product_id) {FarMar::Product.all[37]}
    let (:sample_sale_id) {FarMar::Sale.all[405]}

    it 'It must raise an IllegalArgument if given a non-Fixnum' do
        expect (proc {FarMar::Sale.find("cheese")} ).must_raise ArgumentError
    end

    it 'must find the correct instance' do
        expect(FarMar::Market.find(340).market_id).must_equal(sample_market_id.market_id)
        expect(FarMar::Vendor.find(50).vendor_id).must_equal(sample_vendor_id.vendor_id)
        expect(FarMar::Product.find(37).product_id).must_equal(sample_product_id.product_id)
        expect(FarMar::Sale.find(405).sale_id).must_equal(sample_sale_id.sale_id)

    end
end
