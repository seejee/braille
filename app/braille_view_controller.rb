class BrailleViewController < UIViewController
  def loadView
    self.view = BrailleView.alloc.init
  end

  def viewDidLoad
    view.render 
    view.bind(self)
  end

  def textFieldShouldReturn(text_field)
    translated = BrailleUEB.translate(text_field.text)
    view.show(translated)
    text_field.resignFirstResponder
    true
  end
end
