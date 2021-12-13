class Crabs
  def self.from(data)
    positions = data.split(',').map(&:to_i)
    new(positions)
  end

  def initialize(positions)
    @positions = positions
  end

  def min_position
    @positions.min
  end

  def max_position
    @positions.max
  end

  def cost_to_shift_to(new_position)
    @positions.sum { |position| (position - new_position).abs }
  end

  def best_position
    (min_position..max_position).min_by { |x| cost_to_shift_to(x) }
  end

  def least_fuel
    cost_to_shift_to(best_position)
  end
end
