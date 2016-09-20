require File.expand_path('../../../lib/fe_core_ext', __FILE__)
require 'test/unit'

class HashTest < Test::Unit::TestCase
  def test_clean_remove_nil
    hash = {a: 1, b: nil}
    assert_equal({a: 1}, hash.clean)
  end

  def test_clean_remove_empty
    hash = {a: 1, b: {}}
    assert_equal({a: 1}, hash.clean)
  end
end