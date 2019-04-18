# create a board to play, it creat 9 caseboard
# and a matrix to check the victory condition
# and a hash to bind case with coordonate (a1, a2 ...)
# we can also clear sur board and check who is the winner


class Board
  attr_accessor :board_hash, :board_matrix
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

  def clear_board
    @board_matrix = Matrix.zero(3)
    @board_hash.each { |key, value|  value[0].clear_case}
  end

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
