require 'minitest/autorun'

require './lib/crabs'

class TestCrabs < Minitest::Test
  def setup
    data = '16,1,2,0,4,2,7,1,2,14'
    @crabs = Crabs.from(data)
  end

  def test_min_postition
    assert_equal 0, @crabs.min_position
  end

  def test_max_position
    assert_equal 16, @crabs.max_position
  end

  def test_cost_to_shift_to_1
    assert_equal 41, @crabs.cost_to_shift_to(1)
  end

  def test_cost_to_shift_to_2
    assert_equal 37, @crabs.cost_to_shift_to(2)
  end

  def test_cost_to_shift_to_3
    assert_equal 39, @crabs.cost_to_shift_to(3)
  end

  def test_cost_to_shift_to_10
    assert_equal 71, @crabs.cost_to_shift_to(10)
  end

  def test_finding_best_position
    assert_equal 2, @crabs.best_position
  end

  def test_finding_least_fuel
    assert_equal 37, @crabs.least_fuel
  end
end
