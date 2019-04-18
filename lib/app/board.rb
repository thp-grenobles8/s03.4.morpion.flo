# create a board to play, it creat 9 caseboard
# and a matrix to check the victory condition
# and a hash to bind case with coordonate (a1, a2 ...)
# we can also clear sur board and check who is the winner


class Board
  attr_accessor :board_hash, :board_matrix
  # create a matrix to check the end of the game
  # create hash to link a1, a2 ... to case en coordonate x-y
  def initialize
    @board_matrix = Matrix.zero(3)
    @board_hash = {}
    9.times do |i|
      coordinates = "a#{i%3+1}" if i/3 == 0
      coordinates = "b#{i%3+1}" if i/3 == 1
      coordinates = "c#{i%3+1}" if i/3 == 2
      @board_hash[coordinates] = [BoardCase.new, i/3, i%3]
    end
  end

  # clear the board game
  def clear_board
    @board_matrix = Matrix.zero(3)
    @board_hash.each { |key, value|  value[0].clear_case}
  end

  # check if someone win 
  def still_ongoing
    diagonale, anti_diagonale = 0, 0
    3.times do |i|
      diagonale += @board_matrix.element(i, i)
      anti_diagonale += @board_matrix.element(2-i, i)
      return false, @board_matrix.column(i).sum.positive? if @board_matrix.column(i).sum.abs == 3
      return false, @board_matrix.row(i).sum.positive? if @board_matrix.row(i).sum.abs == 3
      return false, diagonale.positive? if diagonale.abs == 3
      return false, anti_diagonale.positive? if anti_diagonale.abs == 3
    end
    return true
  end
end
