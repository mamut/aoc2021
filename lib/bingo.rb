class Bingo
  class Board
    attr_reader :array

    def initialize(array)
      @array = array
      @rows = array.each_slice(5).to_a
      @columns = @rows.transpose
    end

    def winning?(called)
      (@rows + @columns).each do |line|
        return true if winning_line?(line, called)
      end

      false
    end

    def ==(other)
      array == other.array
    end

    private

    def winning_line?(line, called)
      line.all? { |x| called.include?(x) }
    end
  end

  class Win
    attr_reader :board, :called

    def initialize(board, called)
      @board = board
      @called = called
    end

    def sum_of_unmarked_numbers
      @board.array.reject { |x| @called.include?(x) }.sum
    end

    def winning_number
      @called.last
    end

    def final_score
      sum_of_unmarked_numbers * winning_number
    end

    def ==(other)
      !other.nil? && @board == other.board && @called == other.called
    end
  end

  attr_reader :boards, :numbers

  def self.load(data, numbers)
    boards = data.split("\n\n").map do |chunk|
      array = chunk.split(" ").map(&:to_i)
      Bingo::Board.new(array)
    end

    new(numbers: numbers, boards: boards)
  end

  def initialize(numbers:, boards:)
    @numbers = numbers
    @boards = boards
  end

  def win
    to_call = @numbers.dup
    called = []

    while to_call.length > 0
      called << to_call.shift
      winning_board = @boards.find { |board| board.winning?(called) }

      return Win.new(winning_board, called) unless winning_board.nil?
    end

    nil
  end

  def lose
    to_call = @numbers.dup
    called = []
    remaining_boards = @boards.dup

    while to_call.length > 0
      called << to_call.shift

      if remaining_boards.length == 1 && remaining_boards.first.winning?(called)
        return Win.new(remaining_boards.first, called)
      end

      remaining_boards = remaining_boards.reject { |board| board.winning?(called) }
    end

    nil
  end
end
