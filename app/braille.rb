class Braille

  def translate(input)
    words = input.scan(/\w+/)
    translated = words.map { |w| translate_word(w) }
    translated.join(' ')
  end

  private

  ALPHA = {
    "a" => "\u2801",
    "b" => "\u2803",
    "c" => "\u2809",
    "d" => "\u2819",
    "e" => "\u2811",
    "f" => "\u280b",
    "g" => "\u281b",
    "h" => "\u2813",
    "i" => "\u280a",
    "j" => "\u281a",
    "k" => "\u2805",
    "l" => "\u2807",
    "m" => "\u280d",
    "n" => "\u281d",
    "o" => "\u2815",
    "p" => "\u280f",
    "q" => "\u281f",
    "r" => "\u2817",
    "s" => "\u280e",
    "t" => "\u281e",
    "u" => "\u2825",
    "v" => "\u2827",
    "w" => "\u283a",
    "x" => "\u282d",
    "y" => "\u283d",
    "z" => "\u2835",
  }

  NUMBER = {
    "1" => "\u2801",
    "2" => "\u2803",
    "3" => "\u2809",
    "4" => "\u2819",
    "5" => "\u2811",
    "6" => "\u280b",
    "7" => "\u281b",
    "8" => "\u2813",
    "9" => "\u280a",
    "0" => "\u281a",
  }

  SPECIAL = {
    :capital => "\u2820",
    :number  => "\u283c"
  }

  def translate_word(word)
    braille = ""
    word.each_char { |c| braille << translate_char(c) }
    braille
  end

  def translate_char(c)
    result = ""

    case c.downcase
    when /[a-z]/
      result << SPECIAL[:capital] if c == c.upcase
      result << ALPHA[c.downcase]
    when /[0-9]/
      result << SPECIAL[:number]
      result << NUMBER[c]
    else
      result << c 
    end

    result
  end

end
