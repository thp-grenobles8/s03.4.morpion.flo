class Application
  #initialization of game, need 2 pseudo for player and link with board game
  def initialize(game)
    print "Joueur 1 : quel est ton pseudo ? \n" + ">>> "
    @pseudo1 = gets.chomp.to_s
    print "Joueur 2 : quel est ton pseudo ? \n" + ">>> "
    @pseudo2 = gets.chomp.to_s
    @new_game = Game.new(@pseudo1, @pseudo2) # creat the game with 2 player
    @board_check = @new_game.board_game # link with board game
  end

  # let's start the game
  def start
    continue = 'y'
    @nb_game = 0
    while continue == 'y'
      next_game # call new game method for every round
      print "Voulez-vous refaire une partie ? [Y/N] \n >>> "
      continue = gets.chomp.to_s.downcase
      @nb_game += 1
    end
  end

  def next_game
    @new_game.clear_game
    @new_game.shows.board_stat
    not_finish = true
    piece = 0
    while not_finish && piece < 9 # check if the round is finished
      player_play(first_player[0])
      not_finish, who_win = @board_check.still_ongoing
      piece += 1
      if not_finish && piece < 9
        player_play(first_player[1])
        piece += 1
      end
      not_finish, who_win = @board_check.still_ongoing
    end
    someone_win(who_win, piece)
    @new_game.score
  end

  # alternate first player
  def first_player
    if @nb_game%2 == 0
      return @new_game.player1, @new_game.player2
    else
      return @new_game.player2, @new_game.player1
    end
  end


  def player_play(player_on_play)
    chosen_coordinate = ask_coordinate(player_on_play.name)
    lets_go = false
    until lets_go
      # can't play on coordinate doesn't exist
      if @new_game.board_game.board_hash[chosen_coordinate] == nil
        puts "Cette coordonnée n'existe pas"
        chosen_coordinate = ask_coordinate(player_on_play.name)
      # can't play on coordinate already busy
      elsif !@new_game.board_game.board_hash[chosen_coordinate][0].free?
        puts "Cette coordonnée est déjà prise"
        chosen_coordinate = ask_coordinate(player_on_play.name)
      else
        lets_go = true
      end
    end
    @new_game.player_puts_piece(chosen_coordinate, player_on_play)
  end

  def ask_coordinate(pseudo)
    print "#{pseudo} où veux-tu jouer ?\n>>> "
    gets.chomp.to_s.downcase
  end

  # return the winner or equality
  def someone_win(who_win, round)
    if round==9
      puts "Égalité !!!"
    else
      if who_win
        puts "Le joueur #{@new_game.player1.name} a gagné la partie"
        @new_game.player1.score += 1
      else
        puts "Le joueur #{@new_game.player2.name} a gagné la partie"
        @new_game.player2.score += 1
      end
    end
  end
end
