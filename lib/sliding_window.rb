class SlidingWindow
  def initialize(array, size:)
    @array = array
    @size = size
  end

  def each
    results = []
    data = @array.dup

    head = data.shift(@size)
    tail = head.last(@size - 1) + [data.first]

    while data.length > 0
      results << yield(head, tail)

      head.shift
      head << data.shift
      tail = head.last(@size - 1) + [data.first]
    end

    results
  end
end
