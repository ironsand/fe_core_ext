require_relative '../../lib/fe_core_ext'
require 'timecop'
require 'test/unit'

class DateTest < Test::Unit::TestCase
  def test_parse_as_future
    Timecop.freeze(Date.new(2016, 9, 5))
    assert_equal(Date.new(2016, 9, 6), Date.parse_as_future('9/6'))
    assert_equal(Date.new(2017, 9, 5), Date.parse_as_future('9/5'))
    assert_equal(Date.new(2017, 9, 4), Date.parse_as_future('9/4'))
  end
  
  def test_parse_ja
    assert_equal(Date.new(2016,9,29), Date.parse_ja('2016年9月29日'))
  end

  def test_parsable_ja_format
    refute(Date.parsable?('2016年9月29日'))
  end

  def test_parsable_year_month
    assert(Date.parsable?('2016/09'))
  end

  def test_parse_heisei
    assert_equal(Date.new(2016,9,29), Date.parse_heisei('平成28年9月29日'))
  end

  def test_parse_reiwa
    assert_equal(Date.new(2019,9,29), Date.parse_reiwa('令和1年9月29日'))
    assert_equal(Date.new(2019,9,29), Date.parse_reiwa('令和元年9月29日'))
  end

  def test_parse_gengo
    assert_equal(Date.new(2016,9,29), Date.parse_gengo('平成28年9月29日'))
    assert_equal(Date.new(2019,9,29), Date.parse_reiwa('令和1年9月29日'))
    assert_equal(Date.new(2019,9,29), Date.parse_reiwa('令和元年9月29日'))
  end
end