require 'date'
require_relative 'encryptable'

class Enigma
  include Encryptable
  def encrypt(message, key, date = Date.today)
    #todo: generate random key as optional argument
    {
      encryption: encrypt_message(message),
      key: key,
      date: convert_date(date)
    }
  end

  private

  def convert_date(date)
    if date.is_a?(Date)
      date.strftime('%m%d%y')
    else
      date
    end
  end

  def generate_number
    rand(10 ** 5)
  end
end
