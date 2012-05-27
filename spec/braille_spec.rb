require_relative '../app/braille'

describe Braille do

  subject { Braille.new }

  it "should convert the alphabet" do
    test "a", "\u2801"
    test "b", "\u2803"
    test "c", "\u2809"
    test "d", "\u2819"
    test "e", "\u2811"
    test "f", "\u280b"
    test "g", "\u281b"
    test "h", "\u2813"
    test "i", "\u280a"
    test "j", "\u281a"
    test "k", "\u2805"
    test "l", "\u2807"
    test "m", "\u280d"
    test "n", "\u281d"
    test "o", "\u2815"
    test "p", "\u280f"
    test "q", "\u281f"
    test "r", "\u2817"
    test "s", "\u280e"
    test "t", "\u281e"
    test "u", "\u2825"
    test "v", "\u2827"
    test "w", "\u283a"
    test "x", "\u282d"
    test "y", "\u283d"
    test "z", "\u2835"
  end

  def test(english, braille)
    subject.translate(english).should == braille
  end

end
