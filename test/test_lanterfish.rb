require 'minitest/autorun'

require './lib/lanternfish'

class TestLanternfish < Minitest::Test
  def setup
    @colony = Lanternfish::Colony.from('3,4,3,1,2')
    @lanternfish = Lanternfish.new(@colony)
  end

  def test_colony_knows_how_many_fishes_there_are
    assert_equal 5, @colony.count
  end

  def test_colony_loads_from_a_string
    assert_equal Lanternfish::Colony.new([0, 1, 1, 2, 1, 0, 0, 0, 0]), @colony
  end

  def test_colony_can_evolve
    assert_equal Lanternfish::Colony.from('2,3,2,0,1'), @colony.evolve
  end

  def test_after_2_days
    assert_equal Lanternfish::Colony.from('1,2,1,6,0,8'), @lanternfish.days(2)
  end

  def test_after_18_days
    assert_equal(
      Lanternfish::Colony.from('6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8'),
      @lanternfish.days(18),
    )
  end

  def test_nr_of_fish_after_80_days
    assert_equal 5934, @lanternfish.days(80).count
  end
end
