require_relative 'encryptable'
require_relative 'convertable'

class Enigma
  include Encryptable
  include Convertable

  def generate_number
    rand(10 ** 5).to_s.rjust(5, '0')
  end

  def encrypt(message, key = generate_number, date = Date.today)
    {
      encryption: encrypt_message(message, :encrypt),
      key: key,
      date: convert_date(date)
    }
  end

  def decrypt(message, key, date = Date.today)
    {
      decryption: encrypt_message(message, :decrypt),
      key: key,
      date: convert_date(date)
    }
  end
end
