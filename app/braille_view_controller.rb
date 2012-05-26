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
    @font = UIFont.fontWithName("Helvetica-Light", size: 27.0)
    @braille = Braille.new

    render 
  end

  def render
    view.backgroundColor = UIColor.whiteColor

    @text = build_entry_text(view)
    view.addSubview(@text)

    @braille_display = build_braille_display(@text.frame.origin.y + @text.frame.size.height, view)
    view.addSubview(@braille_display)
  end

  def build_entry_text(parent)
    text = UITextField.new
    text.frame = align_top(@margin, parent) 
    text.font = @font 
    text.borderStyle = UITextBorderStyleRoundedRect
    text
  end

  def build_braille_display(top, parent)
    braille = UITextView.new
    braille.frame = align_bottom(top, @margin, parent) 
    braille.font = @font
    braille
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
