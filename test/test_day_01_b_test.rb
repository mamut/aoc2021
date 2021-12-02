require 'minitest/autorun'

require './lib/day_01_b'

class TestDay01B < Minitest::Test
  def setup
    @day = Day01B.new(data: [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263,
    ])
  end

  def test_that_result_matches_example
    assert_equal 5, @day.run
  end
end
