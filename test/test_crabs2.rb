require 'minitest/autorun'

require './lib/crabs2'

class TestCrabs2 < Minitest::Test
  def setup
    data = '16,1,2,0,4,2,7,1,2,14'
    @crabs = Crabs2.from(data)
  end

  def test_min_postition
    assert_equal 0, @crabs.min_position
  end

  def test_max_position
    assert_equal 16, @crabs.max_position
  end

  def test_cost_to_shift_to_2
    assert_equal 206, @crabs.cost_to_shift_to(2)
  end

  def test_cost_to_shift_to_5
    assert_equal 168, @crabs.cost_to_shift_to(5)
  end

  def test_finding_best_position
    assert_equal 5, @crabs.best_position
  end

  def test_finding_least_fuel
    assert_equal 168, @crabs.least_fuel
  end
end
