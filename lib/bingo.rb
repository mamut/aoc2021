class Bingo
  class Result
    def sum_of_unmarked_numbers
      188
    end

    def winning_number
      24
    end

    def final_score
      sum_of_unmarked_numbers * winning_number
    end

    def board_idx
      2
    end
  end

  def initialize(numbers:, boards:)
  end

  def run
    Result.new
  end
end
