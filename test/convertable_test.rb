require './test/test_helper'
require './lib/convertable'

class TestClass
  include Convertable
end

class EncryptableTest < Minitest::Test
  def setup
    @enigma = TestClass.new
  end

  def test_convert_date
    date = Date.new(2021,1,15)
    assert_equal '150121', @enigma.convert_date(date)
  end
end
