class Vents
  class Line
    def initialize(string)
      %r((?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)) =~ string

      @x1 = x1.to_i
      @x2 = x2.to_i
      @y1 = y1.to_i
      @y2 = y2.to_i
    end

    def city?
      horizontal? || vertical?
    end

    def points
      if horizontal?
        diff = (@x1 - @x2).abs + 1
        start = [@x1, @x2].min
        diff.times.map { |x| [start + x, @y1] }
      elsif vertical?
        diff = (@y1 - @y2).abs + 1
        start = [@y1, @y2].min
        diff.times.map { |y| [@x1, start + y] }
      end
    end

    private

    def horizontal?
      @y1 == @y2
    end

    def vertical?
      @x1 == @x2
    end
  end

  def initialize(data)
    @lines = data.split("\n").map { |chunk| Vents::Line.new(chunk) }
  end

  def nr_of_city_overlaps
    @lines
      .select { |line| line.city? }
      .reduce([]) { |acc, line| acc + line.points }
      .tally
      .count { |_k, value| value > 1 }
  end
end
