module Alignment
  def align_top(margin, parent)
    [[margin, margin * 2], [parent.frame.size.width - margin * 2, margin * 2]]
  end 

  def align_bottom(top, margin, parent)
    [[margin, top + margin], [parent.frame.size.width - margin * 2, parent.frame.size.height - top - margin - margin]]
  end 
end

