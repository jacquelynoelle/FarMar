require 'csv'

module FarMar
  class Vendor
    attr_reader :id, :name, :employees, :market_id
    def initialize(id, name, employees, market_id)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end

      unless market_id.instance_of?(Integer) && market_id > 0
        raise ArgumentError.new("Market ID must be a positive integer (got #{market_id})")
      end

      @id = id
      @name = name
      @employees = employees
      @market_id = market_id
    end

    # self.all: returns a collection of instances, representing all of the
    # objects described in the CSV
    def self.all
      CSV.open('support/vendors.csv').map do |line|
        Vendor.new(line[0].to_i, line[1], line[2], line[3].to_i)
      end
    end

    # self.find(id): returns an instance of the object where the value of the
    # id field in the CSV matches the passed parameter.
    def self.find(id)
      all.select { |vendor| vendor.id == id }.first
    end

    # self.by_market(market_id): returns all of the vendors with the
    # given market_id
    def self.by_market(market_id)
    end

    # self.most_revenue(n) returns the top n vendor instances ranked by total revenue
    def self.most_revenue(n)
    end

    # self.most_items(n) returns the top n vendor instances ranked by total number of items sold
    def self.most_items(n)
    end

    # self.revenue(date) returns the total revenue for that date across all vendors
    def self.revenue(date)
    end

    # market: returns the FarMar::Market instance that is associated with this
    # vendor using the FarMar::Vendor market_id field
    def market
    end

    # products: returns a collection of FarMar::Product instances that are
    # associated by the FarMar::Product vendor_id field.
    def products
    end

    # sales: returns a collection of FarMar::Sale instances that are associated
    # by the vendor_id field.
    def sales
    end

    # revenue: returns the the sum of all of the vendor's sales (in cents)
    def revenue
    end

    # revenue(date) returns the total revenue for that specific purchase date and vendor instance
    def revenue(date)
    end

  end
end
