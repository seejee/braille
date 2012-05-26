class BrailleViewController < UIViewController
  def loadView
    self.view = BrailleView.alloc.init
  end

  def viewDidLoad
    @braille = Braille.new
    view.render 
    view.bind(self)
  end

  def textFieldShouldReturn(text_field)
    translated = @braille.translate(text_field.text)
    view.show(translated)
    true
  end
end
