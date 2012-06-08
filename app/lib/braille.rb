module Braille

  def self.translate(input)
    words = input.scan(/\w+/)
    translated = words.map { |w| Word.new(w).translate }
    translated.join(' ')
  end

end

