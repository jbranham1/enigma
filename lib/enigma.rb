require_relative 'encryptable'
require_relative 'convertable'
require_relative 'findable'

class Enigma
  include Encryptable
  include Convertable
  include Findable

  def generate_number
    rand(10 ** 5).to_s.rjust(5, '0')
  end

  def encrypt(message, key = generate_number, date = Date.today)
    get_type(:encrypt)
    find_shifts(key, convert_date(date))
    {
      encryption: encrypt_message(message),
      key: key,
      date: convert_date(date)
    }
  end

  def decrypt(message, key, date = Date.today)
    get_type(:decrypt)
    find_shifts(key, convert_date(date))
    {
      decryption: encrypt_message(message),
      key: key,
      date: convert_date(date)
    }
  end
end
