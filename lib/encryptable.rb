module Encryptable
  ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    def get_keys(key)
      key.split("").each_cons(2).map do |cons|
        cons.join.to_i
      end
    end

    def get_offsets(date)
      square = date.to_i * date.to_i
      last_four = square.to_s[-4..-1]
      last_four.split("").map do |x|
        x.to_i
      end
    end

    def get_shifts(key, date)
      keys = get_keys(key)
      offsets = get_offsets(date)
      @shifts = {
        a: keys[0] + offsets[0],
        b: keys[1] + offsets[1],
        c: keys[2] + offsets[2],
        d: keys[3] + offsets[3]
      }
    end

    def index_shift
      shifts = @shifts
      {
        '0' => shifts[:a],
        '1'=> shifts[:b],
        '2'=> shifts[:c],
        '3'=> shifts[:d]
      }
    end

    def encrypt_message(message, key, date, type)
      get_shifts(key, date)
      split_message(message).map do |section|
        encrypt_section(section, type)
      end.join
    end

    def encrypt_section(section, type)
      section.each_with_index.map do |letter, index|
        if letter.match(/^[[:alpha:][:blank:]]+$/)
          if type == :encrypt
            encode(letter.downcase, index_shift[index.to_s])
          else
            encode(letter.downcase, -index_shift[index.to_s])
          end
        else
          letter
        end
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
