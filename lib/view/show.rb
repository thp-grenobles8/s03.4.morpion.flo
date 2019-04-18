# class used to show the board game
class Show

  # link Show to the board game
  def initialize(board_game)
    @board_to_show = board_game
  end

  # show stat of the game board
  def board_stat
    lettre = 1
    puts lign_array = Array.new(5){ |x| ' '*10 + [1,2,3].map! { |i|  Ascii.new.write_123(i, x) + '|'}.join}
    puts ' '*10 + ('_'*9 + '|')*3
    for row in %w[a b c] # print every line of the board
      coordinate_row = row
      lign_array = Array.new(5){ |x| Ascii.new.write_abc(lettre, x) + '|'} # on lettre on each line
      for column in (1..3) # + 3 column on each line
        coordinate = coordinate_row + column.to_s
        symbol = @board_to_show.board_hash[coordinate][0].stat
        for lign in (0..4) # print 5 lines for each line on the board
          lign_array[lign] += ' '*9 + '|' if symbol == ' '
          lign_array[lign] += (Ascii.new.write_o(lign) + '|') if symbol == 'O'
          lign_array[lign] += (Ascii.new.write_x(lign) + '|') if symbol == 'X'
        end
      end
      puts lign_array
      puts ' '*9 + ('|' + '_'*9)*3 + '|'
      lettre += 1
    end
  end
end
