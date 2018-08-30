require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    @@column_headers = [:id, :name, :address, :city, :county, :state, :zip]

    def initialize(id, name, address, city, county, state, zip)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end

      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    # self.all: returns a collection of instances, representing all of the
    # objects described in the CSV
    def self.all
      # add headers
      all_markets = CSV.open('support/markets.csv','r+', :write_headers => true,
        :headers => @@column_headers).each do |line|
        # convert CSV::Row objects to hash
        market_hash = line.to_h
        # create a new Market object using values from the hash
        FarMar::Market.new(
          market_hash[:id],
          market_hash[:name],
          market_hash[:address],
          market_hash[:city],
          market_hash[:county],
          market_hash[:state],
          market_hash[:zip]
        )
        # market object is stored in current index of all_markets
      end
      @@column_headers = nil # set to nil after first header insertion
      return all_markets
    end

    # self.find(id): returns an instance of the object where the value of the
    # id field in the CSV matches the passed parameter.
    def self.find(id)
    end

    # vendors: returns a collection of FarMar::Vendor instances that are
    # associated with the market by the market_id field.
    def vendors
    end

    # self.search(search_term) returns a collection of FarMar::Market instances
    # where the market name or vendor name contain the search_term. For example
    # FarMar::Market.search('school') would return 3 results, one being the
    # market with id 75 (Fox School Farmers FarMar::Market).
    def self.search(search_term)
    end

    # products returns a collection of FarMar::Product instances that are
    # associated to the market through the FarMar::Vendor class.
    def products
    end

    # prefered_vendor: returns the vendor with the highest revenue
    def prefered_vendor
    end

    # prefered_vendor(date): returns the vendor with the highest revenue for
    # the given date
    def prefered_vendor(date)
    end

    # worst_vendor: returns the vendor with the lowest revenue
    def worst_vendor
    end

    # worst_vendor(date): returns the vendor with the lowest revenue on the
    # given date
    def worst_vendor(date)
    end


  end
end

FarMar::Market.all
