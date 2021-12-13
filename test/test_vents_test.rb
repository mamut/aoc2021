require 'minitest/autorun'

require './lib/vents'

class TestVents < Minitest::Test
  def setup
    @data = <<~DATA
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
    DATA

    @vents = Vents.new(@data)
  end

  def test_line_horizontal
    line = Vents::Line.new('0,9 -> 5,9')
    assert_equal true, line.city?
    assert_equal [[0,9], [1,9], [2,9], [3,9], [4,9], [5,9]], line.points
  end

  def test_line_vertical
    line = Vents::Line.new('7,0 -> 7,4')
    assert_equal true, line.city?
    assert_equal [[7,0], [7,1], [7,2], [7,3], [7,4]], line.points
  end

  def test_line_diagonal
    line = Vents::Line.new('8,0 -> 0,8')
    assert_equal false, line.city?
    assert_nil line.points
  end

  def test_number_of_overlaps
    assert_equal 5, @vents.nr_of_city_overlaps
  end
end
