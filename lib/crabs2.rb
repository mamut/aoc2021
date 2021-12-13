require './lib/crabs'

class Crabs2 < Crabs
  private

  def cost(position, new_position)
    shift = (position - new_position).abs
    (1..shift).sum
  end
end
