module Encryptable
  ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    def get_keys(key)
      key.split("").each_cons(2).map do |cons|
        cons.join.to_i
      end
    end

    def encrypt_message(message, type)
      split_message(message).map do |section|
        encrypt_section(section, type)
      end.join
    end

    def encrypt_section(section, type)
      section.each_with_index.map do |letter, index|
        if letter.match(/^[[:alpha:][:blank:]]+$/)
          if type == :encrypt
            encode(convert_letter(letter), get_index_shift(index))
          else
            encode(convert_letter(letter), -get_index_shift(index))
          end
        else
          letter
        end
      end
    end

    def get_index_shift(index)
      if index == 0
        3
      elsif index == 1
        27
      elsif index == 2
        73
      elsif index == 3
        20
      end
    end

    def encode(letter, number)
      shifted_array = ALPHABET.rotate(number)
      index = ALPHABET.find_index(letter)
      letter = shifted_array[index]
    end

    def split_message(message)
      message_split = message.split('').each_slice(4).to_a
    end
  end
