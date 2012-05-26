module Alignment
  def align_top(margin, parent)
    [[margin, margin * 2], [parent.frame.size.width - margin * 2, margin * 2]]
  end 

  def align_bottom(top, margin, parent)
    [[margin, top + margin], [parent.frame.size.width - margin * 2, parent.frame.size.height - top - margin - margin]]
  end 
end

class BrailleViewController < UIViewController
  include Alignment

  def viewDidLoad
    @margin = 20
    @braille = Braille.new

    view.backgroundColor = UIColor.whiteColor

    add_entry_text
    add_braille_display
  end

  def add_entry_text
    @text = UITextField.new
    @text.frame = align_top(@margin, view) 
    @text.font = UIFont.fontWithName("Helvetica-Light", size: 27.0)
    @text.borderStyle = UITextBorderStyleRoundedRect
    view.addSubview(@text)
  end

  def add_braille_display 
    braille = UITextView.new
    braille.frame = align_bottom(@text.frame.origin.y + @text.frame.size.height, @margin, view) 
    braille.font = UIFont.fontWithName("Helvetica-Light", size: 27.0)
    text = ""
    10.times do 
      text << @braille.random
      text << " "
    end
    braille.text = text 
    view.addSubview(braille)
  end

end

class Braille
  def random
    characters.sample
  end

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
