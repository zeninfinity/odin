class TicTacToe

  def initialize()
    @board=Array.new(3){Array.new(3)}
    @turn=0
    puts "Board created."
    print_board
    puts ""
  end

  def print_board
    @board.each {|line| p line}
  end
  
  def play()
    puts "Let's Play!"
    puts ""
    game_complete=0
    while game_complete != 1
      valid_move=0
      while valid_move==0
        puts"-------------"
        puts whos_turn(@turn) + "'s Turn."
        puts"-------------"
        puts "Input X Position (between 0-2)"
        x=gets.chomp
        puts "Input Y Position (between 0-2)"
        y=gets.chomp
        puts "x = #{x}, y = #{y}"
        move_response=check_location(@turn, x, y)
        if move_response == "ok"
          puts "Move Successful"
          print_board
          valid_move+=1
        else
          puts move_response
          print_board
        end
      end
      if check_win(@board) == 1
				puts whos_turn(@turn) + " Wins!!!!!!"
        exit
      else
        @turn+=1
      end
    end 

    #Get location
  end

  def whos_turn(turn)
    if @turn % 2 == 0 
			return "White"
		else
      return "Black"
    end
  end

  private


  def check_win(board)
    for i in 0 .. 2
      #check veriticals
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i]) && board[0][i] != nil && board[1][i] != nil
        return 1
      #check horizontal
      elsif board[i][0] == board[i][1] && board[i][0] == board[i][2] &&  board[i][0] != nil && board[i][1] != nil
        return 1
      #check diagonals
      elsif board[0][0] == board[1][1] && board[0][0] == board[2][2] &&  board[0][0] != nil && board[1][1] != nil
        return 1
      elsif board[0][2] == board[1][1] && board[0][2] == board[2][0] &&  board[0][2] != nil && board[1][1] != nil
        return 1
      end
    end
    return 0
  end
  
  def check_location (turn, x, y)
    #check if integers 
    if !(x.to_i.to_s == x && y.to_i.to_s == y )
      puts ""
      return "X/Y are not both integers.  Try again."

    #check if x,y between 0,2
    elsif !(x.to_i.between?(0, 2) && y.to_i.between?(0, 2))
      puts ""
      puts "X/Y not between 0-2.  Try again."
    
    #check if nil
    elsif @board[x.to_i][y.to_i] != nil
      puts ""
      return "X=#{x}, Y=#{y} is already taken with #{@board[x.to_i][y.to_i]}.  Try again."
    
    #place location
    else
      puts ""
      @board[x.to_i][y.to_i]=whos_turn(@turn)
      return "ok"
    end
  end
end

game=TicTacToe.new
game.play
