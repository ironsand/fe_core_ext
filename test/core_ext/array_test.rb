require File.expand_path('../../../lib/fe_core_ext', __FILE__)
require 'test/unit'

class ArrayTest < Test::Unit::TestCase
  test 'When Array is empty, #mean should be nil' do
    assert_nil([].mean)
  end
end