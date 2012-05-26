class BrailleViewController < UIViewController
  def loadView
    self.view = BrailleView.alloc.init
  end

  def viewDidLoad
    @braille = Braille.new
    view.render 
    view.show(build_random_braille)
  end

  def build_random_braille
    text = ""
    15.times do 
      text << @braille.random
    end
    text
  end
end
