require 'minitest/autorun'

require './lib/sliding_window'

class TestSlidingWindow < Minitest::Test
  def setup
    @window = SlidingWindow.new([
      10,
      20,
      30,
      40,
      50,
      60,
    ], size: 3)
  end

  def test_that_window_yields_head_and_tails
    mock = Minitest::Mock.new

    mock.expect :call, 1, [[10, 20, 30], [20, 30, 40]]
    mock.expect :call, 2, [[20, 30, 40], [30, 40, 50]]
    mock.expect :call, 3, [[30, 40, 50], [40, 50, 60]]

    result = @window.each do |head, tail|
      mock.call(head, tail)
    end

    assert_equal [1, 2, 3], result

    mock.verify
  end
end
