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
      diff_x = (@x1 - @x2).abs + 1
      diff_y = (@y1 - @y2).abs + 1

      sign_x = (@x2 - @x1) > 0 ? 1 : -1
      sign_y = (@y2 - @y1) > 0 ? 1 : -1

      diff = [diff_x, diff_y].max

      diff.times.map do |idx|
        [
          @x1 + (diff_x > 1 ? idx : 0) * sign_x,
          @y1 + (diff_y > 1 ? idx : 0) * sign_y,
        ]
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

  def nr_of_overlaps
    count_intersections(@lines)
  end

  def nr_of_city_overlaps
    @lines
      .select { |line| line.city? }
      .then { |lines| count_intersections(lines) }
  end

  private

  def count_intersections(lines)
    lines
      .reduce([]) { |acc, line| acc + line.points }
      .tally
      .count { |_k, value| value > 1 }
  end
end
