require './test/test_helper'
require './lib/encryptable'

class TestClass
  include Encryptable
end

class EncryptableTest < Minitest::Test
  def setup
    @enigma = TestClass.new
  end

  def test_it_exists
    assert_instance_of TestClass, @enigma
  end
end
