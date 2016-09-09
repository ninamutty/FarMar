require_relative 'spec_helper'
require_relative '../lib/Product'

# vendor	Instance	returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Productvendor_id field ((See FarMar::Vendor.find(id)))

# sales	Instance	returns a collection of FarMar::Sale instances that are associated using the FarMar::Saleproduct_id field.

# number_of_sales	Instance	returns the number of times this product has been sold

# self.by_vendor(vendor_id)	Class	returns all of the products with the given vendor_id (see FarMar::Vendor #products)


describe 'testing Product class methods method' do
    let (:product_instance) {FarMar::Product.find(35)}
    let (:products_by_vendor) {FarMar::Product.by_vendor(72)}


    #######################################
    ###'testing vendor instance method' ###
    #######################################
    it 'must return a vendor instance' do
        expect (product_instance.vendor).must_be_kind_of FarMar::Vendor
    end

    it 'must search for the instance of vendor that has a vendor_id equal to the vendor_id of the product instance' do
        product_instance.vendor.vendor_id.must_equal (FarMar::Vendor.find(product_instance.vendor_id).vendor_id)
    end
    

    ######################################
    ###'testing sales instance method' ###
    ######################################
    it 'must return an array of sales instances' do
        expect (product_instance.sales).must_be_kind_of Array
        product_instance.sales.each {|sale| sale.must_be_kind_of FarMar::Sale}
    end

    it 'must search for instances of sales who have a product_id equal to the product_id of the Product instance' do
        product_instance.sales.each {|sale| (sale.product_id).must_equal (product_instance.product_id)}
    end


    #################################################
    ### 'testing number_of_sales instance method' ###
    #################################################
    it 'must return a Fixnum value' do
        expect (product_instance.number_of_sales).must_be_kind_of Fixnum
    end

    it 'must return the number of sales that have the same product_id number' do
        product_instance.number_of_sales.must_equal product_instance.sales.length
    end


    ########################################################
    ### 'testing self.by_vendor(vendor_id) class method' ###
    ########################################################
    it 'must return an array of product instances' do
        expect (products_by_vendor).must_be_kind_of Array
        products_by_vendor.each {|product| product.must_be_kind_of FarMar::Product}
    end

    it 'must search for instances of products who have a vendor_id equal to the given vendor_id' do
        products_by_vendor.each {|product| (product.vendor_id).must_equal (72)}
    end
end
