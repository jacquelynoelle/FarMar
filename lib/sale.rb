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
  end
end
