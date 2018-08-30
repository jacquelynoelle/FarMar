require_relative 'spec_helper.rb'

describe "Product" do
  describe "#initialize" do
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
end
