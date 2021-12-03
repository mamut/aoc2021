class Diagnostic
  def initialize(data)
    @tallied = tally(data)
  end

  def gamma_rate
    @tallied
      .map { |tally| tally[0] > tally[1] ? 0 : 1 }
      .then { |bytes| to_int(bytes) }
  end

  def epsilon_rate
    @tallied
      .map { |tally| tally[0] < tally[1] ? 0 : 1 }
      .then { |bytes| to_int(bytes) }
  end

  def power_consumption
    gamma_rate * epsilon_rate
  end

  private

  def tally(data)
    data
      .map { |string| string.chars.map(&:to_i) }
      .transpose
      .map { |list| list.tally }
  end

  def to_int(bytes)
    bytes.join.to_i(2)
  end
end
