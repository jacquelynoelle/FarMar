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

    it "requires an integer for ID, number of employees, and market ID" do
      # ID must be an integer
      expect{
        FarMar::Vendor.new("not an integer", "test", 3, 1)
      }.must_raise ArgumentError

      # number of employees must be an integer
      expect{
        FarMar::Vendor.new(1, "test", "not an integer", 1)
      }.must_raise ArgumentError

      # market id must be an integer
      expect{
        FarMar::Vendor.new(1, "test", 3, "not an integer")
      }.must_raise ArgumentError
    end

    it "requires a positive ID, number of employees, and market ID" do
      # ID must be positive
      expect{
        FarMar::Vendor.new(-10, "test", 3, 1)
      }.must_raise ArgumentError

      # number of employees must be positive
      expect{
        FarMar::Vendor.new(1, "test", -10, 1)
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
end
