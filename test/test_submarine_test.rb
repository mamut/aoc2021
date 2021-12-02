require 'minitest/autorun'

require './lib/submarine'

class TestSubmarine < Minitest::Test
  def setup
    @submarine = Submarine.new
    @initial_state = {
      horizontal: 0,
      depth: 0,
      multiplied: 0,
    }
  end

  def test_that_it_ends_up_in_right_place
    commands = [
      [:forward, 5],
      [:down, 5],
      [:forward, 8],
      [:up, 3],
      [:down, 8],
      [:forward, 2],
    ]

    state = @submarine.run(@initial_state, commands)

    assert_equal({
      horizontal: 15,
      depth: 10,
      multiplied: 150,
    }, state)
  end

  def test_forward
    state = @submarine.next(@initial_state, [:forward, 5])
    assert_equal 5, state[:horizontal]
  end

  def test_up
    state = @submarine.next(@initial_state, [:up, 5])
    assert_equal -5, state[:depth]
  end

  def test_down
    state = @submarine.next(@initial_state, [:down, 5])
    assert_equal 5, state[:depth]
  end
end
