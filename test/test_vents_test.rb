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

  def test_line_diagonal_1
    line = Vents::Line.new('1,1 -> 3,3')
    assert_equal false, line.city?
    assert_equal [[1,1], [2,2], [3,3]], line.points
  end

  def test_line_diagonal_2
    line = Vents::Line.new('0,3 -> 3,0')
    assert_equal false, line.city?
    assert_equal [[0,3], [1,2], [2,1], [3,0]], line.points
  end

  def test_number_of_city_overlaps
    assert_equal 5, @vents.nr_of_city_overlaps
  end

  def test_number_of_overlaps
    assert_equal 12, @vents.nr_of_overlaps
  end
end
