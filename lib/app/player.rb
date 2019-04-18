# creat players, 2 for a game
# player has a pseudo, a shape to play,
# a value +/-1 for the victory condition checking
# and a score
class Player
  attr_accessor :name, :piece_shape, :score
  def initialize(pseudo, shape, value, score = 0)
    @name = pseudo
    @piece_shape = shape
    @player_value = value
    @score = score
  end


  def play(coordinate, board_game)
      board_game.board_hash[coordinate][0].played(@piece_shape)
      x = board_game.board_hash[coordinate][1]
      y = board_game.board_hash[coordinate][2]
      board_game.board_matrix.send :[]=, x, y, @player_value
  end
end
