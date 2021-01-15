require 'date'

module Convertable
  def convert_date(date)
    if date.is_a?(Date)
      date.strftime('%d%m%y')
    else
      date
    end
  end

  def convert_letter(letter)
    letter.downcase
  end
end
