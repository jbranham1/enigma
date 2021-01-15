require 'minitest/pride'
require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    enigma = Enigma.new
    encrypt_hash = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal encrypt_hash, enigma.encrypt("hello world", "02715","040895")
  end

  def test_encrypt_with_optional_arguements
    enigma = Enigma.new
    encrypt_hash = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    enigma.stubs(:convert_date).returns("040895")
    assert_equal encrypt_hash, enigma.encrypt("hello world", "02715")
  end

  def test_decrypt
    enigma = Enigma.new
    encrypt_hash = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal encrypt_hash, enigma.decrypt("keder ohulw", "02715","040895")
  end

  def test_decrypt_with_optional_arguements
    enigma = Enigma.new
    encrypt_hash = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    enigma.stubs(:convert_date).returns("040895")
    assert_equal encrypt_hash, enigma.decrypt("keder ohulw", "02715")
  end
end
