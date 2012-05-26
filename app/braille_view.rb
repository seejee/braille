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

    braille_display_top = @text.frame.origin.y + @text.frame.size.height
    @braille_display = build_braille_display(braille_display_top, self)
    self.addSubview(@braille_display)
  end

  def show(braille)
    @braille_display.text = braille
  end

  def bind(target)
    @text.delegate = target
  end

  private

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
