module Encryptable
  ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

  def get_type(type)
    @type = type
  end

  def encrypt_message(message)
    split_message(message).map do |section|
      encrypt_section(section)
    end.join
  end

  def split_message(message)
    message.split('').each_slice(4).to_a
  end

  def encrypt_section(section)
    section.each_with_index.map do |letter, index|
      if letter.match(/^[[:alpha:][:blank:]]+$/)
        index_shift(letter, index)
      else
        letter
      end
    end
  end

  def index_shift(letter, index)
    if @type == :encrypt
      encode(letter.downcase, index_shift_keys[index.to_s])
    else
      encode(letter.downcase, -index_shift_keys[index.to_s])
    end
  end

  def encode(letter, number)
    shifted_array = ALPHABET.rotate(number)
    index = ALPHABET.find_index(letter)
    letter = shifted_array[index]
  end
end
