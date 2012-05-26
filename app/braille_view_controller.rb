class BrailleViewController < UIViewController
  def loadView
    self.view = BrailleView.alloc.init
  end

  def viewDidLoad
    @braille = Braille.new
    view.render 
  end

end
