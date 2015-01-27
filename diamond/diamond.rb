# Attempt at diamond kata from this blog post:
# http://claysnow.co.uk/recycling-tests-in-tdd/

RSpec.describe "PrintDiamond" do 
  it "prints A for A" do
    expect(PrintDiamond("A")).to eq "A"
  end
  it "prints a diamond for B" do
    b_result = <<-eos
 A
B B
 A
eos
    expect(PrintDiamond("B")).to eq b_result.chomp
  end
  it "prints a diamond for C" do
    c_result = <<-eos
  A
 B B
C C C
 B B
  A
eos
    expect(PrintDiamond("C")).to eq c_result.chomp
  end
  it "prints a diamond for C" do
    d_result = <<-eos
   A
  B B
 C C C
D D D D
 C C C
  B B
   A
eos
    expect(PrintDiamond("D")).to eq d_result.chomp
  end

end

def PrintDiamond(letter)
  start = letter.ord
  levels = (start - "A".ord) + 1
  rows = []
  i = 0
  while (i < levels)
    padding = levels - i - 1
    letter = "A".ord + i
    row = " "*padding + (letter.chr * (i + 1)).split(//).join(" ")
    rows << row
    i += 1
  end
  reverse_rows = rows.reverse
  reverse_rows.shift
  total_rows = rows + reverse_rows
  total_rows.join "\n"
end
