module Encryptable
  ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

  def encrypt_message(message)
    split_message(message).map do |section|
      encrypt_section(section)
    end.join
  end

  def encrypt_section(section)
    section.each_with_index.map do |letter, index|
      letter == " " if letter == "_"
      encode(letter, get_index_shift(index))
    end
  end

  def get_index_shift(index)
    if index == 0
      3
    elsif index == 1
      27
    elsif index == 2
      73
    elsif index ==3
      20
    end
  end

  def encode(letter, number)
    shifted_array = ALPHABET.rotate(number)
    index = ALPHABET.find_index(letter)
    letter = shifted_array[index]
  end

  def split_message(message)
    message_split = message.split("")
    message_split.each_slice(4).to_a
  end
end