require_relative 'spec_helper.rb'

describe 'tests' do
  it 'should run some tests' do
    true.must_equal false
  end

  it 'should have access to stuff in market.rb' do
    JACKIE.must_equal 50
  end
end
