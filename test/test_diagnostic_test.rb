require 'minitest/autorun'

require './lib/diagnostic'

class TestDiagnostic < Minitest::Test
  def setup
    @diagnostic = Diagnostic.new([
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010',
    ])
  end

  def test_gamma_rate
    assert_equal 22, @diagnostic.gamma_rate
  end

  def test_epsilon_rate
    assert_equal 9, @diagnostic.epsilon_rate
  end

  def test_power_consumption
    assert_equal 198, @diagnostic.power_consumption
  end
end
