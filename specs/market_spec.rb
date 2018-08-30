require_relative 'spec_helper.rb'

describe "Market" do
  describe "#initialize" do
    it "Creates an instance of market" do
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      market.must_be_kind_of FarMar::Market
    end

    it "Keeps track of ID" do
      id = 1337
      market = FarMar::Market.new(id, "People's Co-op Farmers Market",
        "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      market.must_respond_to :id
      market.id.must_equal id
    end

    it "Keeps track of name" do
      name = "test"
      market = FarMar::Market.new(1, name,
        "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      market.must_respond_to :name
      market.name.must_equal name
    end

    it "Keeps track of address" do
      address = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        address, "Portland", "Multnomah", "Oregon", "97202")
      market.must_respond_to :address
      market.address.must_equal address
    end

    it "Keeps track of city" do
      city = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        "30th and Burnside", city, "Multnomah", "Oregon", "97202")
      market.must_respond_to :city
      market.city.must_equal city
    end

    it "Keeps track of county" do
      county = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        "30th and Burnside", "Portland", county, "Oregon", "97202")
      market.must_respond_to :county
      market.county.must_equal county
    end

    it "Keeps track of state" do
      state = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        "30th and Burnside", "Portland", "Multnomah", state, "97202")
      market.must_respond_to :state
      market.state.must_equal state
    end

    it "Keeps track of zip" do
      zip = "12345"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market",
        "30th and Burnside", "Portland", "Multnomah", "Oregon", zip)
      market.must_respond_to :zip
      market.zip.must_equal zip
    end

  end
end
