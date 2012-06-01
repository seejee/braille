class Braille

  def random
    characters.sample
  end

  def translate(input)
    words = input.scan(/\w+/)
    translated = words.map { |w| translate_word(w) }
    translated.join(' ')
  end

  private

  UEB = {
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

  def translate_word(word)
    braille = ""
    word.each_char { |c| braille << translate_char(c) }
    braille
  end

  def translate_char(c)
    result = ""

    if(c == c.upcase)
      result << "\u2820"
    end

    c = c.downcase
    result << UEB[c] || random
    result
  end

  def characters
    @characters ||= build_characters
  end

  def build_characters
    chars = []

    (0x2800..0x283F).each do |i|
      chars << to_unicode(i.to_s(16))
    end

    chars
  end

  def to_unicode(hex_string)
   [hex_string.hex].pack("U")
  end

end
