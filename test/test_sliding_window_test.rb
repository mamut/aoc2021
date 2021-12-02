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
    ])
  end

  def test_that_window_yields_head_and_tails
    mock = Minitest::Mock.new

    mock.expect :call, 1, [[10], [20, 30, 40, 50]]
    mock.expect :call, 2, [[10, 20], [30, 40, 50]]
    mock.expect :call, 3, [[10, 20, 30], [40, 50]]
    mock.expect :call, 4, [[10, 20, 30, 40], [50]]

    result = @window.each do |head, tail|
      mock.call(head, tail)
    end

    assert_equal [1, 2, 3, 4], result

    mock.verify
  end
end
