require_relative 'spec_helper'
require_relative '../lib/Vendor'


describe 'testing markets instance method' do
    let (:vendor_instance) {FarMar::Vendor.find(52)}

    it 'must return a market instance' do
        expect (vendor_instance.markets).must_be_kind_of FarMar::Market
    end

    it 'must search for the instance of markets that has a market_id equal to the market_id of the Vendor instance' do
        vendor_instance.markets.market_id.must_equal (FarMar::Market.find(vendor_instance.market_id).market_id)
    end
end


describe 'testing products instance method' do
    let (:vendor_instance) {FarMar::Vendor.find(38)}

    it 'must return an array of product instances' do
        expect (vendor_instance.products).must_be_kind_of Array
        vendor_instance.products.each {|product| product.must_be_kind_of FarMar::Product}
    end

    it 'must search for instances of products who have a vendor_id equal to the vendor_id of the Vendor instance' do
        vendor_instance.products.each {|product| (product.vendor_id).must_equal (vendor_instance.vendor_id)}
    end
end


describe 'testing sales instance method' do
    let (:vendor_instance) {FarMar::Vendor.find(12)}

    it 'must return an array of sales instances' do
        expect (vendor_instance.sales).must_be_kind_of Array
        vendor_instance.sales.each {|sale| sale.must_be_kind_of FarMar::Sale}
    end

    it 'must search for instances of sales who have a vendor_id equal to the vendor_id of the Vendor instance' do
        vendor_instance.sales.each {|sale| (sale.vendor_id).must_equal (vendor_instance.vendor_id)}
    end
end


describe 'testing revenue instance method' do
    let (:vendor_instance) {FarMar::Vendor.find(15)}
    let(:sale_sum) {
        total = 0
        vendor_instance.sales.each {|sale| total += sale.sale_amount}
        total}

    it 'must return a Fixnum value' do
        expect (vendor_instance.revenue).must_be_kind_of Fixnum
    end

    it 'must equal the sum of the amounts of sales' do
        vendor_instance.revenue.must_equal (sale_sum)
    end
end


describe 'testing self.by_market(market_id) class method' do
    let (:vendors_by_market) {FarMar::Vendor.by_market(20)}

    it 'must return an array of vendor instances' do
        expect (vendors_by_market).must_be_kind_of Array
        vendors_by_market.each {|vendor| vendor.must_be_kind_of FarMar::Vendor}
    end

    it 'must search for instances of vendors who have a market_id equal to the given market_id' do
        vendors_by_market.each {|vendor| (vendor.market_id).must_equal (20)}
    end
end
