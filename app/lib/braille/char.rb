module Braille
  class Char < String

    def upper?
      c == c.upcase
    end

    def number?
      c =~ /[0-9]/
    end

    def punctuation?
      c =~ /[.!?]/ 
    end

    def letter?
      c.downcase =~ /[a-z]/
    end

    private

    def c
      self
    end

  end
end
