require_relative 'spec_helper'
require_relative '../lib/Market'

describe 'Tsting self.all' do
    it 'must return a hash' do
        expect (FarMar::Market.all).must_be_kind_of Hash
    end

    it 'Must return a collection of all of the instances of the class it is called on' do
        expect(FarMar::Market.all).must_equal(FarMar::Market.class_info)
        expect(FarMar::Product.all).must_equal(FarMar::Product.class_info)
        expect(FarMar::Sale.all).must_equal(FarMar::Sale.class_info)
        expect(FarMar::Vendor.all).must_equal(FarMar::Vendor.class_info)
    end
end

describe 'Testing self.find(id)' do
    it 'It must raise an IllegalArgument if given a non-Fixnum' do
        expect (proc {FarMar.find("cheese")} ).must_raise ArgumentError
    end

    it 'must be able to be called on a class of FarMar' do
        expect (FarMar::Market.find(6)).must_equal FarMar::Market.class_info[6]
    end
end
