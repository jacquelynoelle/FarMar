module FarMar
  class Vendor
    attr_reader :id, :name, :employees, :market_id
    def initialize(id, name, employees, market_id)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end

      unless employees.instance_of?(Integer) && employees > 0
        raise ArgumentError.new("# of employees must be an integer greater than zero (got #{employees})")
      end

      unless market_id.instance_of?(Integer) && market_id > 0
        raise ArgumentError.new("Market ID must be a positive integer (got #{market_id})")
      end

      @id = id
      @name = name
      @employees = employees
      @market_id = market_id
    end
  end
end
