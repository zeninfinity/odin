class Mastermind
  def initialize
    @totalturns=12
    @color_map = {
      0 =>  ["R","Red"],
      1 => ["B","Blue"],
      2 => ["Y","Yellow"],
      3 => ["G","Green"],
      4 => ["W","White"],
      5 => ["K","Black"]
    }
    @master=create_master(@color_map)
    puts "Welcome to Mastermind.  A new master code has been created (Secret:#{@master})"
  end

  def play
    turn=0
    while turn!=@totalturns
      puts ""
      puts "Turn:#{turn+1} \nEnter your 4 letter guess (R=Red, B=Blue, Y=Yellow, G=Green, W=White, K=Black):"
      #until turn
      guess=gets.chomp.split("")
      check_guess(@master, guess, turn)
      turn+=1
      #end
    end
  end

  private 
  def create_master(color_map)
    num=Random.rand(6)
    colorcode=color_map[num][0]
    master=4.times.map{ color_map[Random.rand(6)][0] } 
    return master
  end

  def check_guess(master, guess, turn)
    #Check if 4 chacters
    #check if each guess is RBYGWK
    
    #checks guess against master
    if (master == guess)
      puts "You Win!"
      exit
    elsif turn+1 == @totalturns
      puts "You have reached the #{@totalturns}th turn.  You LOSE!  GAME OVER!  Do not pass go.  Go be sad!"
    else
      puts "Incorrect Guess"
    end
  end
end

mmgame=Mastermind.new.play
#mmgame.play

