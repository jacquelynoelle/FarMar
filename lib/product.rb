require 'csv'
require_relative 'loadable'

module FarMar
  class Product < Loadable
    attr_reader :name, :vendor_id
    def initialize(id, name, vendor_id)
      unless vendor_id.instance_of?(Integer) && vendor_id > 0
        raise ArgumentError.new("Vendor ID must be a positive integer (got #{vendor_id})")
      end

      super(id)
      @name = name
      @vendor_id = vendor_id
    end

    def self.from_csv_line(line)
      self.new(line[0].to_i, line[1], line[2].to_i)
    end

    def self.csv_filename
      'support/products.csv'
    end

    # self.find_by_vendor(vendor_id): returns all of the products with the
    # given vendor_id
    def self.find_by_vendor(vendor_id)
      all.select { |product| product.vendor_id == vendor_id }
    end

    # self.most_revenue(n) returns the top n product instances ranked by
    # total revenue
    def self.most_revenue(n)
    end

    # vendor: returns the FarMar::Vendor instance that is associated with this
    # product using the FarMar::Product vendor_id field
    def vendor
      return Vendor.find(vendor_id)
    end

    # sales: returns a collection of FarMar::Sale instances that are associated
    # using the FarMar::Sale product_id field.
    def sales
    end

    # number_of_sales: returns the number of times this product has been sold.
    def number_of_sales
    end

  end
end
