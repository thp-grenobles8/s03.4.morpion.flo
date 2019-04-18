class Game
  attr_accessor :board_game, :player1, :player2, :shows
  def initialize(name1, name2)
    @player1 = Player.new(name1, "O", 1)
    @player2 = Player.new(name2, "X", -1)
    @board_game = Board.new
    @shows = Show.new(@board_game)
  end

  def player_puts_piece(coordinate, player_focus)
    player_focus.play(coordinate, @board_game)
    @shows.board_stat
  end

  def clear_game
    @board_game.clear_board
  end

  def score
    puts "le score est de : "
    print "#{@player1.name} : #{@player1.score} VS "
    print "#{@player2.name} : #{@player2.score} \n"
  end
end
