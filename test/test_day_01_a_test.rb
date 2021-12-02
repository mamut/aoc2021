require 'minitest/autorun'

require './lib/day_01_a'

class TestDay01A < Minitest::Test
  def setup
    @day = Day01A.new(data: [
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
    assert_equal 7, @day.run
  end
end
