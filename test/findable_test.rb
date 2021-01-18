require './test/test_helper'
require './lib/findable'

class TestClass
  include Findable
end

class FindableTest < Minitest::Test
  def setup
    @enigma = TestClass.new
  end

  def test_it_exists
    assert_instance_of TestClass, @enigma
  end

  def test_find_keys
    result = @enigma.find_keys('02715')
    assert_equal [02, 27, 71, 15], result
  end

  def test_find_offsets
    result = @enigma.find_offsets('040895')
    assert_equal [1, 0, 2, 5], result
  end

  def test_find_shifts
    offset_hash =
    {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }
    assert_equal offset_hash, @enigma.find_shifts('02715','040895')
  end

  def test_index_shift_keys
    @enigma.find_shifts('02715','040895')
    hash = {
      '0' => 3,
      '1'=> 27,
      '2'=> 73,
      '3'=> 20
    }
    assert_equal hash, @enigma.index_shift_keys
  end
end
