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

  def test_get_keys
    result = @enigma.get_keys('02715')
    assert_equal [02, 27, 71, 15], result
  end

  def test_get_offsets
    result = @enigma.get_offsets('040895')
    assert_equal [1, 0, 2, 5], result
  end

  def test_get_shifts
    offset_hash =
    {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }
    assert_equal offset_hash, @enigma.get_shifts('02715','040895')
  end

  def test_index_shift
    @enigma.get_shifts('02715','040895')
    hash = {
      '0' => 3,
      '1'=> 27,
      '2'=> 73,
      '3'=> 20
    }
    assert_equal hash, @enigma.index_shift
  end

  def test_encrypt_message
    result = @enigma.encrypt_message('hello world', '02715','040895',:encrypt)
    assert_equal 'keder ohulw', result
  end

  def test_encrypt_section
    @enigma.get_shifts('02715','040895')
    result = @enigma.encrypt_section(['h', 'e', 'l', 'l'], :encrypt)
    assert_equal ['k', 'e', 'd', 'e'], result
  end

  def test_encrypt_section_with_other_characters
    @enigma.get_shifts('02715','040895')
    result = @enigma.encrypt_section(['h', 'e', 'l', '!'], :encrypt)
    assert_equal ['k', 'e', 'd', '!'], result
  end

  def test_encrypt_message_with_decrypt
    result = @enigma.encrypt_message('keder ohulw', '02715','040895', :decrypt)
    assert_equal 'hello world', result
  end

  def test_encrypt_section_decrypt
    @enigma.get_shifts('02715','040895')
    result = @enigma.encrypt_section(['k', 'e', 'd', 'e'], :decrypt)
    assert_equal ['h', 'e', 'l', 'l'], result
  end

  def test_encode
    assert_equal 'k', @enigma.encode('h', 3)
  end

  def test_split_message
    split_array = [["h", "e", "l", "l"], ["o", "_", "w", "o"], ["r", "l", "d"]]
    assert_equal split_array, @enigma.split_message("hello_world")
  end
end
