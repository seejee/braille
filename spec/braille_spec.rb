require_relative '../app/braille'

describe Braille do

  subject { Braille.new }

  it "should convert the alphabet" do
    verify "a", "\u2801"
    verify "b", "\u2803"
    verify "c", "\u2809"
    verify "d", "\u2819"
    verify "e", "\u2811"
    verify "f", "\u280b"
    verify "g", "\u281b"
    verify "h", "\u2813"
    verify "i", "\u280a"
    verify "j", "\u281a"
    verify "k", "\u2805"
    verify "l", "\u2807"
    verify "m", "\u280d"
    verify "n", "\u281d"
    verify "o", "\u2815"
    verify "p", "\u280f"
    verify "q", "\u281f"
    verify "r", "\u2817"
    verify "s", "\u280e"
    verify "t", "\u281e"
    verify "u", "\u2825"
    verify "v", "\u2827"
    verify "w", "\u283a"
    verify "x", "\u282d"
    verify "y", "\u283d"
    verify "z", "\u2835"
  end

  it "should convert capital letters" do
    verify "Z", "\u2820\u2835"
  end

  it "should convert numbers" do
    verify "1", "\u283c\u2801"
    verify "2", "\u283c\u2803"
    verify "3", "\u283c\u2809"
    verify "4", "\u283c\u2819"
    verify "5", "\u283c\u2811"
    verify "6", "\u283c\u280b"
    verify "7", "\u283c\u281b"
    verify "8", "\u283c\u2813"
    verify "9", "\u283c\u280a"
    verify "0", "\u283c\u281a"
  end

  def verify(english, braille)
    subject.translate(english).should == braille
  end

end
