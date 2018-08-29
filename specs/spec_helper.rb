require 'minitest'
require 'minitest/reporters'
require 'minitest/autorun'

require_relative '../far_mar'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
