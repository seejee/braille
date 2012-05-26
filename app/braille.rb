class Braille
  def random
    characters.sample
  end

  def translate(input)
    random
  end

  private

  def characters
    @characters ||= build_characters
  end

  def build_characters
    chars = []

    (0x2800..0x28FF).each do |i|
      chars << to_unicode(i.to_s(16))
    end

    chars
  end

  def to_unicode(hex_string)
   [hex_string.hex].pack("U")
  end
end
