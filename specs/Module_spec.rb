require_relative 'spec_helper'
require_relative '../lib/Market'

describe 'Tsting self.all' do
    let (:market_info) {FarMar::Market.all}
    let (:vendor_info) {FarMar::Vendor.all}
    let (:product_info) {FarMar::Product.all}
    let (:sale_info) {FarMar::Sale.all}

    let (:sample_market_id) {market_info[340]}
    let (:sample_vendor_id) {vendor_info[50]}
    let (:sample_product_id) {product_info[37]}
    let (:sample_sale_id) {sale_info[405]}



    ##########################
    ### 'Testing self.all' ###
    ##########################
    it 'must return a hash' do
        expect (FarMar::Market.all).must_be_kind_of Hash
    end

    it 'Must return a collection of all of the instances of the class it is called on' do
        market_info.each_value {|object| object.class.must_equal FarMar::Market}
        vendor_info.each_value {|object| object.class.must_equal FarMar::Vendor}
        product_info.each_value {|object| object.class.must_equal FarMar::Product}
        sale_info.each_value {|object| object.class.must_equal FarMar::Sale}

    end

    ###############################
    ### 'Testing self.find(id)' ###
    ###############################
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
