require 'minitest/autorun'

require './lib/sonar'

class TestSonar < Minitest::Test
  def setup
    @sonar = Sonar.new(data: [
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
    assert_equal 7, @sonar.run
  end
end
