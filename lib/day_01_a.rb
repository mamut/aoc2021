class Day01A
  def initialize(data:)
    @data = data
  end

  def run
    previous = @data[0..-2]
    current = @data[1..-1]

    pairs = previous.zip(current)

    pairs.count { |(prev, curr)| prev < curr }
  end
end
