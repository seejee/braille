module Alignment
  def align_top(margin, parent)
    [[margin, margin * 2], [parent.frame.size.width - margin * 2, margin * 2]]
  end 

  def align_bottom(top, margin, parent)
    [[margin, top + margin], [parent.frame.size.width - margin * 2, parent.frame.size.height - top - margin - margin]]
  end 
end

class BrailleView < UIView
  include Alignment

  def initWithFrame(rect)
    if(super)
      @margin = 20
      @font = UIFont.fontWithName("Helvetica-Light", size: 27.0)
    end
    self
  end

  def render
    self.backgroundColor = UIColor.whiteColor

    @text = build_text(self)
    self.addSubview(@text)

    @braille_display = build_braille_display(@text.frame.origin.y + @text.frame.size.height, self)
    self.addSubview(@braille_display)
  end

  def build_text(parent)
    UITextField.new.tap do |t|
      t.frame = align_top(@margin, parent) 
      t.font = @font 
      t.borderStyle = UITextBorderStyleRoundedRect
    end
  end

  def build_braille_display(top, parent)
    UITextView.new.tap do |t|
      t.frame = align_bottom(top, @margin, parent) 
      t.font = @font
    end
  end
end
