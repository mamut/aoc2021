require './lib/sliding_window'

class Day01B
  def initialize(data:)
    @data = data
  end

  def run
    @window = SlidingWindow.new(@data, size: 3)

    results = @window.each do |head, tail|
      head.sum < tail.sum
    end

    results.count(&:itself)
  end
end
