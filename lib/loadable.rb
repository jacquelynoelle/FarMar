module FarMar
  class Loadable
    attr_reader :id

    def initialize(id)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end
      @id = id
    end

    def self.from_csv_line(line)
      raise NotImplementedError.new("Implement this in the subclass")
    end

    def self.csv_filename
      raise NotImplementedError.new("Implement this in the subclass")
    end

    # self.all: returns a collection of instances, representing all of the
    # objects described in the CSV
    def self.all
      CSV.open(csv_filename).map do |line|
        from_csv_line(line)
      end
    end

    # self.find(id): returns an instance of the object where the value of the
    # id field in the CSV matches the passed parameter.
    def self.find(id)
      all.select { |entry| entry.id == id }.first
    end
  end
end
