# 1. ID - (Fixnum) uniquely identifies the sale
# 2. Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# 3. Purchase_time - (Datetime) when the sale was completed
# 4. Vendor_id - (Fixnum) a reference to which vendor completed the sale
# 5. Product_id - (Fixnum) a reference to which product was sold

require_relative 'spec_helper.rb'

describe "Sale" do
  describe "#initialize" do
    it "Creates an instance of sale" do
      sale = FarMar::Sale.new(1, 150, DateTime.now, 1, 1)
      sale.must_be_kind_of FarMar::Sale
    end

    it "Keeps track of ID" do
      id = 1337
      sale = FarMar::Sale.new(id, 150, DateTime.now, 1, 1)
      sale.must_respond_to :id
      sale.id.must_equal id
    end

    it "Keeps track of amount" do
      amount = 150
      sale = FarMar::Sale.new(1, amount, DateTime.now, 1, 1)
      sale.must_respond_to :amount
      sale.amount.must_equal amount
    end

    it "Keeps track of vendor ID" do
      vendor_id = 1337
      sale = FarMar::Sale.new(1, 150, DateTime.now, vendor_id, 1)
      sale.must_respond_to :vendor_id
      sale.vendor_id.must_equal vendor_id
    end

    it "Keeps track of product ID" do
      product_id = 1337
      sale = FarMar::Sale.new(1, 150, DateTime.now, 1, product_id)
      sale.must_respond_to :product_id
      sale.product_id.must_equal product_id
    end

    it "requires an integer for ID, amount, vendor ID, and product ID" do
      # ID must be an integer
      expect{
        FarMar::Sale.new("not an integer", 150, DateTime.now, 1, 1)
      }.must_raise ArgumentError

      # amount must be an integer
      expect{
        FarMar::Sale.new(1, "not an integer", DateTime.now, 1, 1)
      }.must_raise ArgumentError

      # vendor id must be an integer
      expect{
        FarMar::Sale.new(1, 150, DateTime.now, "not an integer", 1)
      }.must_raise ArgumentError

      # product id must be an integer
      expect{
        FarMar::Sale.new(1, 150, DateTime.now, 1, "not an integer")
      }.must_raise ArgumentError
    end

    it "requires a positive ID, vendor ID, and product ID" do
      # ID must be positive
      expect{
        FarMar::Sale.new(-10, 150, DateTime.now, 1, 1)
      }.must_raise ArgumentError

      # amount must be positive
      expect{
        FarMar::Sale.new(1, -10, DateTime.now, 1, 1)
      }.must_raise ArgumentError

      # vendor id must be positive
      expect{
        FarMar::Sale.new(1, 150, DateTime.now, -10, 1)
      }.must_raise ArgumentError

      # product id must be positive
      expect{
        FarMar::Sale.new(1, 150, DateTime.now, 1, -10)
      }.must_raise ArgumentError
    end

    it "Keeps track of purchase time" do
      purchase_time = DateTime.now
      sale = FarMar::Sale.new(1, 150, purchase_time, 1, 1)
      sale.must_respond_to :purchase_time
      sale.purchase_time.must_be_instance_of DateTime
      sale.purchase_time.must_equal purchase_time
    end

  end
end
