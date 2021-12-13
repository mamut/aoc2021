class Lanternfish
  class Colony
    def self.from(data)
      indexes = data.split(",").map(&:to_i)
      fish = Array.new(9, 0)

      indexes.each { |idx| fish[idx] += 1 }

      new(fish)
    end

    attr_reader :fish

    def initialize(fish)
      @fish = fish
    end

    def evolve
      new_fish = @fish.dup
      ready = new_fish.shift
      new_fish << 0

      new_fish[6] += ready
      new_fish[8] += ready

      self.class.new(new_fish)
    end

    def count
      @fish.sum
    end

    def ==(other)
      !other.nil? && @fish == other.fish
    end
  end

  def initialize(colony)
    @colony = colony
  end

  def days(count)
    colony = @colony

    count.times { colony = colony.evolve }

    colony
  end
end
