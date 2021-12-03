class Diagnostic
  def initialize(data)
    @data = convert(data)
    @tallied = tally(@data)
  end

  def gamma_rate
    @tallied
      .map { |tally| most_common(tally) }
      .then { |bytes| to_int(bytes) }
  end

  def epsilon_rate
    @tallied
      .map { |tally| least_common(tally) }
      .then { |bytes| to_int(bytes) }
  end

  def power_consumption
    gamma_rate * epsilon_rate
  end

  def oxygen_generator_rating
    filter_numbers { |tally| most_common(tally) }
  end

  def co2_scrubber_rating
    filter_numbers { |tally| least_common(tally) }
  end

  def life_support_rating
    oxygen_generator_rating * co2_scrubber_rating
  end

  private

  def filter_numbers
    results = @data
    remaining_tally = @tallied

    @tallied.size.times do |idx|
      target = yield(remaining_tally[idx])

      results = results.select { |bytes| bytes[idx] == target }
      remaining_tally = tally(results)

      return to_int(results[0]) if results.size == 1
    end
  end

  def convert(data)
    data
      .map { |string| string.chars.map(&:to_i) }
  end

  def tally(data)
    data
      .transpose
      .map { |list| list.tally }
  end

  def to_int(bytes)
    bytes.join.to_i(2)
  end

  def most_common(tally)
    tally[0] > tally[1] ? 0 : 1
  end

  def least_common(tally)
    tally[0] <= tally[1] ? 0 : 1
  end
end
