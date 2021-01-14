require 'date'

class Enigma
  def initialize
  end

  def encrypt(message, key, date = Date.today)
    #todo: encyrpt message
    #todo: generate random key as optional argument
    {
      encryption: message,
      key: key,
      date: date.strftime('%m%d%y')
    }
  end
end
