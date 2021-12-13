require 'minitest/autorun'

require './lib/bingo'

class TestBingo < Minitest::Test
  def setup
    @numbers = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8,
                19, 3, 26, 1]
    @data = <<~DATA
      22 13 17 11  0
       8  2 23  4 24
      21  9 14 16  7
       6 10  3 18  5
       1 12 20 15 19

       3 15  0  2 22
       9 18 13 17  5
      19  8  7 25 23
      20 11 10 24  4
      14 21 16 12  6

      14 21 17 24  4
      10 16 15  9 19
      18  8 23 26 20
      22 11 13  6  5
       2  0 12  3  7
    DATA

    @bingo = Bingo.load(@data, @numbers)
    @board = Bingo::Board.new(
      [
        14, 21, 17, 24,  4,
        10, 16, 15,  9, 19,
        18,  8, 23, 26, 20,
        22, 11, 13,  6,  5,
         2,  0, 12,  3,  7,
      ],
    )
    @losing_board = Bingo::Board.new(
      [
         3, 15,  0,  2, 22,
         9, 18, 13, 17,  5,
        19,  8,  7, 25, 23,
        20, 11, 10, 24,  4,
        14, 21, 16, 12,  6,
      ],
    )
    @win = Bingo::Win.new(@board, [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24])
    @lose = Bingo::Win.new(@losing_board, [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13])
  end

  def test_board_loading
    bingo = Bingo.load(@data, @numbers)
    assert_equal @numbers, bingo.numbers
    assert_equal @board, bingo.boards[2]
  end

  def test_sum_of_unmarked_numbers
    assert_equal 188, @win.sum_of_unmarked_numbers
  end

  def test_winning_number
    assert_equal 24, @win.winning_number
  end

  def test_final_score
    assert_equal 4512, @win.final_score
  end

  def test_bingo_board_doesnt_win_with_no_calls
    assert_equal false, @board.winning?([])
  end

  def test_bingo_board_doesnt_win
    assert_equal false, @board.winning?([1, 2, 3, 4, 5])
  end

  def test_bingo_board_wins_horizontal
    assert_equal true, @board.winning?([18, 8, 23, 26, 20])
  end

  def test_bingo_board_wins_vertical
    assert_equal true, @board.winning?([17, 15, 23, 13, 12])
  end

  def test_bingo_finds_the_winning_board
    assert_equal @win, @bingo.win
  end

  def test_bingo_finds_the_losing_board
    assert_equal @lose, @bingo.lose
  end
end
