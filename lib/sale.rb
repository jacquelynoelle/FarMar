require 'csv'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end

      unless amount.instance_of?(Integer) && amount > 0
        raise ArgumentError.new("Amount must be a positive integer (got #{amount})")
      end

      unless vendor_id.instance_of?(Integer) && vendor_id > 0
        raise ArgumentError.new("Vendor ID must be a positive integer (got #{vendor_id})")
      end

      unless product_id.instance_of?(Integer) && product_id > 0
        raise ArgumentError.new("Product ID must be a positive integer (got #{product_id})")
      end

      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    # self.all: returns a collection of instances, representing all of the
    # objects described in the CSV
    def self.all
    end

    # self.find(id): returns an instance of the object where the value of the
    # id field in the CSV matches the passed parameter.
    def self.find(id)
    end

    # self.between(beginning_time, end_time): returns a collection of
    # FarMar::Sale objects where the purchase time is between the two times given as arguments
    def self.between(beginning_time, end_time)
    end

    # vendor: returns the FarMar::Vendor instance that is associated with this
    # sale using the FarMar::Sale vendor_id field
    def vendor
    end

    # product: returns the FarMar::Product instance that is associated with
    # this sale using the FarMar::Sale product_id field
    def product
    end

  end
end
