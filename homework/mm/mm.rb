class Mastermind
  def initialize
    @total_turns=12
    @guess_results=[]
    @color_map = {
      0 => ["R","Red"],
      1 => ["B","Blue"],
      2 => ["Y","Yellow"],
      3 => ["G","Green"],
      4 => ["W","White"],
      5 => ["K","Black"]
    }
    @master=create_master(@color_map)
    puts "Welcome to Mastermind.  A new master code has been created." # (Secret:#{@master})"
    puts "R=Red, B=Blue, Y=Yellow, G=Green, W=White, K=Black, P=Perfect, C=CorrectColor: "
  end

  def play
    turn=1
    while !turn_checker(turn)
      until turn(turn)
      end
      turn+=1
    end
  end

  private 
  def create_master(color_map)
    num=Random.rand(6)
    colorcode=color_map[num][0]
    master=4.times.map{ color_map[Random.rand(6)][0] } 
    return master
  end

  def turn(turn)
    puts " "
    puts "Turn:#{turn} (#{@master.join})\nEnter 4 letter guess: "
    guess=gets.chomp.split("")
    guess_result=check_guess(@master, guess, turn)
    print_board(@guess_results)

    if guess_result
      return true
    else
      return false
    end
  end

  def print_board(guess_results)
    puts "---------------"
    guess_results.each_with_index { |line, index|
      puts "| #{index+1} #{line[0].join} #{line[1].join} | "
    }
    puts "---------------"
  end

  def turn_checker(turn)
    if (turn == @total_turns+1)
      puts " "
      puts "\nYou have reached the #{@total_turns}th turn.  \nYou LOSE!  \nGAME OVER DUDE!  \nDo not pass go.  \nGo be sad!"
      exit
    else
      return false
    end

  end

  def check_guess(master, guess, turn)
    #Check if 4 characters
    if guess.length != 4
      puts "Guess not 4 digits"
      return false
    end

    #Check all are in @colors_map - RBYGWK
    guess.each { |g|
      good_color_count=@color_map.select {|index, color| color[0]==g }.count
      if good_color_count != 1
        puts "Guess not all colors (RBYGWK), try again."
        return false
      end
    }

    # Ok, 4 characters, all correct
    
    # Checks guess against master
    check_win(master,guess)

    ##Check How close
    color_results=check_color(master, guess)

    # Add to Guesses
    @guess_results << [guess, color_results]
    return true
  end
end

def check_win(master,guess)
  if (master == guess)
      puts "-----------------------"
      puts "| Holy Shit, You Win! | "
      puts "-----------------------"
      exit
  end
end

def check_color(master, guess)
  color_results = Array.new(4)
  master_reduce=master.dup

  # Correct location
  guess.each_with_index { | g, index |
    if g==master[index]
      color_results[index] = "P"
      master_reduce[index] = "-"
    end
  }

  # Correct Color
  guess.each_with_index { | g, index |
    if g!=master[index]
      if master_reduce.include? g
        color_results[index] = "C"
        master_reduce[master_reduce.find_index(g)] = "-"
      else
        color_results[index] = "-"
      end
    end
  }

  return color_results.sort.reverse!
end

def format_results(correct_location, correct_color)
  array=[]
  correct_location.times{array << "P"}
  correct_color.times{array << "C"}
  (4-correct_location-correct_color).times{array << "-"}
  return array
end

mmgame=Mastermind.new.play
