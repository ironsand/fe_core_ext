require File.expand_path('../../../lib/fe_core_ext', __FILE__)
require 'timecop'
require 'test/unit'

class DateTest < Test::Unit::TestCase
  def test_parse_as_future
    Timecop.freeze(Date.new(2016, 9, 5))
    assert_equal(Date.new(2016, 9, 6), Date.parse_as_future('9/6'))
    assert_equal(Date.new(2017, 9, 5), Date.parse_as_future('9/5'))
    assert_equal(Date.new(2017, 9, 4), Date.parse_as_future('9/4'))
  end
end