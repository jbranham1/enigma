module Findable
  def find_keys(key)
    key.split("").each_cons(2).map do |cons|
      cons.join.to_i
    end
  end

  def find_offsets(date)
    square = date.to_i * date.to_i
    last_four = square.to_s[-4..-1]
    last_four.split("").map do |num|
      num.to_i
    end
  end

  def find_shifts(key, date)
    keys = find_keys(key)
    offsets = find_offsets(date)
    @shifts = {
      a: keys[0] + offsets[0],
      b: keys[1] + offsets[1],
      c: keys[2] + offsets[2],
      d: keys[3] + offsets[3]
    }
  end

  def index_shift_keys
    shifts = @shifts
    {
      '0' => shifts[:a],
      '1'=> shifts[:b],
      '2'=> shifts[:c],
      '3'=> shifts[:d]
    }
  end
end
