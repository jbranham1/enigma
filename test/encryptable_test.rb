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

  def test_encrypt_message
    assert_equal "keder ohulw", @enigma.encrypt_message("hello world")
  end

  def test_encrypt_section
    assert_equal ["k", "e", "d", "e"], @enigma.encrypt(["h", "e", "l", "l"])
  end

  def test_get_index_shift
    assert_equal 3, @enigma.get_index_shift(0)
  end

  def test_encode
    assert_equal "k", @enigma.encode("h", 3)
  end

  def test_split_message
    split_array = [["h", "e", "l", "l"], ["o", "_", "w", "o"], ["r", "l", "d"]]
    assert_equal split_array, @enigma.split_message("hello_world")
  end
end
