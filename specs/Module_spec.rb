require_relative 'spec_helper'
require_relative '../lib/Market'

describe 'Tsting self.all' do
    let (:market_info) {FarMar::Base.all("support/markets.csv")}
    let (:vendor_info) {FarMar::Base.all("support/vendors.csv")}
    let (:product_info) {FarMar::Base.all("support/products.csv")}
    let (:sale_info) {FarMar::Base.all("support/sales.csv")}

    it 'must return a hash' do
        expect (FarMar::Market.all("support/markets.csv")).must_be_kind_of Hash
    end

    it 'must accept no parameters' do
        expect (FarMar::Market.all).must_equal (FarMar::Market.all("support/markets.csv"))
    end

    it 'Must return a collection of all of the instances of the class it is called on' do
        market_info.must_equal FarMar::Market.all
        vendor_info.must_equal FarMar::Vendor.all
        product_info.must_equal FarMar::Product.all
        sale_info.must_equal FarMar::Sale.all

        # expect(FarMar::Market.all).must_equal(market_info)
        # expect(FarMar::Product.all).must_equal(product_info)
        # expect(FarMar::Sale.all).must_equal(sale_info)
        # expect(FarMar::Vendor.all).must_equal(vendor_info)
    end
end

describe 'Testing self.find(id)' do
    let (:sample_market_id) {FarMar::Market.all[340]}

    it 'It must raise an IllegalArgument if given a non-Fixnum' do
        expect (proc {FarMar::Sale.find("cheese")} ).must_raise ArgumentError
    end

    it 'must find the correct instance' do
        expect(FarMar::Market.find(340)).must_be :==, (sample_market_id)
    end
end
