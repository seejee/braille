module Braille

  def self.translate(input)
    words = input.scan(/[0-9A-Za-z_.!?]+/)
    translated = words.map { |w| Word.new(w).translate }
    translated.join(' ')
  end

end

