require_relative 'spec_helper.rb'

describe "Vendor" do
  describe "#initialize" do
    it "Creates an instance of vendor" do
      vendor = FarMar::Vendor.new(1, "A Vendor", 3, 1)
      vendor.must_be_kind_of FarMar::Vendor
    end

    it "Keeps track of ID" do
      id = 1337
      vendor = FarMar::Vendor.new(id, "A Vendor", 3, 1)
      vendor.must_respond_to :id
      vendor.id.must_equal id
    end

    it "requires an integer for ID and market ID" do
      # ID must be an integer
      expect{
        FarMar::Vendor.new("not an integer", "test", 3, 1)
      }.must_raise ArgumentError

      # market id must be an integer
      expect{
        FarMar::Vendor.new(1, "test", 3, "not an integer")
      }.must_raise ArgumentError
    end

    it "requires a positive ID and market ID" do
      # ID must be positive
      expect{
        FarMar::Vendor.new(-10, "test", 3, 1)
      }.must_raise ArgumentError

      # market id must be positive
      expect{
        FarMar::Vendor.new(1, "test", 3, -10)
      }.must_raise ArgumentError
    end

    it "Keeps track of name" do
      name = "test"
      vendor = FarMar::Vendor.new(1, name, 3, 1)
      vendor.must_respond_to :name
      vendor.name.must_equal name
    end

    it "Keeps track of number of employees" do
      employees = 3
      vendor = FarMar::Vendor.new(1, "A Vendor", employees, 1)
      vendor.must_respond_to :employees
      vendor.employees.must_equal employees
    end

    it "Keeps track of market id" do
      market_id = 3
      vendor = FarMar::Vendor.new(1, "A Vendor", 3, market_id)
      vendor.must_respond_to :market_id
      vendor.market_id.must_equal market_id
    end
  end

  describe "all" do
    it "returns an array" do
      vendors = FarMar::Vendor.all
      vendors.must_be_kind_of Array
    end

    it "returns a collection full of Vendors" do
      vendors = FarMar::Vendor.all

      vendors.each do |vendor|
        vendor.must_be_kind_of FarMar::Vendor
      end
    end

    it "returns the correct number of Vendors" do
      vendors = FarMar::Vendor.all
      vendors.length.must_equal 2690
    end

    it "Gets the first Vendor from the file" do
      vendors = FarMar::Vendor.all
      vendors.first.id.must_equal 1
    end

    it "Gets the last Vendor from the file" do
      vendors = FarMar::Vendor.all
      vendors.last.id.must_equal 2690
    end
  end

  describe "find" do
    it "Returns nil if the vendor does not exist" do
      vendor = FarMar::Vendor.find(12345)
      vendor.must_be_nil
    end

    it "Finds the first vendor" do
      id = 1
      vendor = FarMar::Vendor.find(id)
      vendor.must_be_kind_of FarMar::Vendor
      vendor.id.must_equal id
    end

    it "Finds the last vendor" do
      id = 1893
      vendor = FarMar::Vendor.find(id)
      vendor.must_be_kind_of FarMar::Vendor
      vendor.id.must_equal id
    end
  end
end
