class Application
  def initialize(game)
    print "Joueur 1 : quel est ton pseudo ? \n" + ">>> "
    @pseudo1 = gets.chomp.to_s
    print "Joueur 2 : quel est ton pseudo ? \n" + ">>> "
    @pseudo2 = gets.chomp.to_s
    @new_game = Game.new(@pseudo1, @pseudo2)
    @board_check = @new_game.board_game
  end

  def start
    continue = 'y'
    @nb_game = 0
    while continue == 'y'
      next_game
      print "Voulez-vous refaire une partie ? [Y/N] \n >>> "
      continue = gets.chomp.to_s.downcase
      @nb_game += 1
    end
  end

  def next_game
    @new_game.clear_game
    @new_game.shows.board_stat
    not_finish = true
    round = 0
    while not_finish && round < 9
      player_play(first_player[0])
      not_finish, who_win = @board_check.still_ongoing
      round += 1
      if not_finish && round < 9
        player_play(first_player[1])
        round += 1
      end
      not_finish, who_win = @board_check.still_ongoing
    end
    someone_win(who_win, round)
    @new_game.score
  end

  def first_player
    if @nb_game%2 == 0
      return @new_game.player1, @new_game.player2
    else
      return @new_game.player2, @new_game.player1
    end
  end

  def player_play(player_on_play)
    chosen_coordinate = ask_coordinate(player_on_play.name)
    while @new_game.board_game.board_hash[chosen_coordinate] == nil
      puts "Cette coordonnée n'existe pas"
      chosen_coordinate = ask_coordinate(player_on_play.name)
    end
    until @new_game.board_game.board_hash[chosen_coordinate][0].free?
      puts "Cette coordonnée est déjà prise"
      chosen_coordinate = ask_coordinate(player_on_play.name)
    end
    @new_game.player_puts_piece(chosen_coordinate, player_on_play)
  end

  def ask_coordinate(pseudo)
    print "#{pseudo} où veux-tu jouer ?\n>>> "
    gets.chomp.to_s.downcase
  end

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
