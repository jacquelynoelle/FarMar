require_relative 'spec_helper.rb'

describe "Product" do
  describe "Product#initialize" do
    it "Creates an instance of product" do
      product = FarMar::Product.new(1, "A Product", 1)
      product.must_be_kind_of FarMar::Product
    end

    it "Keeps track of ID" do
      id = 1337
      product = FarMar::Product.new(id, "A Product", 1)
      product.must_respond_to :id
      product.id.must_equal id
    end

    it "requires an integer for ID and vendor ID" do
      # ID must be an integer
      expect{
        FarMar::Product.new("not an integer", "test", 1)
      }.must_raise ArgumentError

      # vendor id must be an integer
      expect{
        FarMar::Product.new(1, "test", "not an integer")
      }.must_raise ArgumentError
    end

    it "requires a positive ID and vendor ID" do
      # ID must be positive
      expect{
        FarMar::Product.new(-10, "test", 1)
      }.must_raise ArgumentError

      # vendor id must be positive
      expect{
        FarMar::Product.new(1, "test", -10)
      }.must_raise ArgumentError
    end

    it "Keeps track of name" do
      name = "test"
      product = FarMar::Product.new(1, name, 1)
      product.must_respond_to :name
      product.name.must_equal name
    end

    it "Keeps track of vendor id" do
      vendor_id = 3
      product = FarMar::Product.new(1, "A Product", vendor_id)
      product.must_respond_to :vendor_id
      product.vendor_id.must_equal vendor_id
    end
  end

  describe "Product#vendor" do
    it "Returns an instance of Vendor with the correct id" do
      product = FarMar::Product.new(1337, "test product", 10)
      vendor = product.vendor
      vendor.must_be_kind_of FarMar::Vendor
      vendor.id.must_equal product.vendor_id
    end

    it "Returns nil when the vendor_id doesn't correspond to a real vendor" do
      # Assumption: there is no vendor 12345
      vendor_id = 12345
      FarMar::Vendor.find(vendor_id).must_be_nil "Whoops, didn't expect vendor #{vendor_id} to exist, which invalidates the test"

      product = FarMar::Product.new(1337, "test product", vendor_id)
      vendor = product.vendor
      vendor.must_be_nil
    end
  end

  describe "Product#self.all" do
    it "returns an array" do
      products = FarMar::Product.all
      products.must_be_kind_of Array
    end

    it "returns a collection full of Products" do
      products = FarMar::Product.all

      products.each do |product|
        product.must_be_kind_of FarMar::Product
      end
    end

    it "returns the correct number of Products" do
      products = FarMar::Product.all
      products.length.must_equal 8193
    end

    it "Gets the first Product from the file" do
      products = FarMar::Product.all
      products.first.id.must_equal 1
    end

    it "Gets the last Product from the file" do
      products = FarMar::Product.all
      products.last.id.must_equal 8193
    end
  end

  describe "Product#self.find" do
    it "Returns nil if the product does not exist" do
      product = FarMar::Product.find(12345)
      product.must_be_nil
    end

    it "Finds the first product" do
      id = 1
      product = FarMar::Product.find(id)
      product.must_be_kind_of FarMar::Product
      product.id.must_equal id
    end

    it "Finds the last product" do
      id = 1893
      product = FarMar::Product.find(id)
      product.must_be_kind_of FarMar::Product
      product.id.must_equal id
    end
  end

  describe "find_by_vendor" do
    it "does something if the vendor id is invalid" do
      vendor_id = "not an id"
      vendor_id = 999999
      products = FarMar::Product.find_by_vendor(vendor_id)
      products.must_be_empty
    end

    it "returns an empty array if no products match" do
      # Assumption: no products have vendor id 999999
      vendor_id = 999999
      products = FarMar::Product.find_by_vendor(vendor_id)
      products.must_be_empty
    end

    it "returns an array of one Product if one product matches" do
      vendor_id = 3
      products = FarMar::Product.find_by_vendor(vendor_id)
      products.length.must_equal 1

      products.each do |product|
        product.must_be_kind_of FarMar::Product
        product.vendor_id.must_equal vendor_id
      end
    end

    it "return sn array of many Products if many products match" do
      vendor_id = 4
      products = FarMar::Product.find_by_vendor(vendor_id)
      products.length.must_equal 3

      products.each do |product|
        product.must_be_kind_of FarMar::Product
        product.vendor_id.must_equal vendor_id
      end
    end
  end
end
