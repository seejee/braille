module Braille
  class Word
    def initialize(word)
      @word = word
    end

    def translate
      braille = ""
      previous = Char.new("")

      @word.each_char do |c|
        c = Char.new(c)
        braille << translate_char(previous, c)
        previous = c
      end

      braille
    end

    def translate_char(previous, c)
      result = ""

      if c.letter?
        result << SPECIAL[:capital] if c.upper?
        result << ALPHA[c.downcase]
      elsif c.number?
        result << SPECIAL[:number] unless previous.number?
        result << NUMBER[c]
      elsif c.punctuation?
        result << SPECIAL[:full_stop]
      else
        result << c
      end

      result
    end

  end
end

