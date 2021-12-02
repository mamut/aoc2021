class SlidingWindow
  def initialize(array)
    @array = array
  end

  def each
    results = []
    data = @array.dup

    head = []
    tail = data

    while data.length > 1
      head << data.shift
      results << yield(head, tail)
    end

    results
  end
end
