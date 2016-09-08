require_relative 'spec_helper'
require_relative '../lib/Market'

describe 'testing vendors instance method' do
    let (:market_instance) {FarMar::Market.find(300)}

    it 'must return an array of vendor instances' do
        expect (market_instance.vendors).must_be_kind_of Array
        market_instance.vendors.each {|vendor| vendor.must_be_kind_of FarMar::Vendor}
    end

    it 'must search for instances of vendors who have a market_id equal to the market_id of the Market instance' do
        market_instance.vendors.each {|vendor| (vendor.market_id).must_equal (market_instance.market_id)}
    end

end
