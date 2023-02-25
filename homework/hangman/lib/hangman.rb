require 'json'

class Hangman 

  def initialize
    @dir="saves"
    @word
    @wrongs=0
    @total_wrongs=9
    @letters_picked = []
    @turn=1

    @word=get_word.upcase.split('')
    @guesses = Array.new(@word.size)
    puts "Welcome to Hangman. (#{@word.join})"
  end

  def play
    puts "Game Started:"
    while !wrong_checker(@wrongs)
      until turn(@turn)
      end
      @turn+=1
    end
  end

  private

  def get_word
    #Open file to array
    file=File.open('data/wordlist.txt')
    words = file.readlines.map(&:chomp)

    #Get / return Random Word
    word=""
    until word != ""
      word_sample=words.sample
      if word_sample.length.between?(5 , 12)
        word = word_sample
      end
    end
    return word
  end

  def turn(turn)
    puts " "
    display_board(@guesses)
    puts " "

    puts "Turn:#{turn} Wrong:#{@wrongs}/#{@total_wrongs}\nEnter a letter: "
    letter=gets.upcase.chomp

    #if 1, 2, ? 
    if letter=="?"
      print_instructions
      return false

    elsif letter=="0"
      puts "EXITING"
      exit

    elsif letter=="1" || letter=="2"
      save_load_game(letter)
      return false

    elsif letter_check(letter)
      insert_guess(letter)
      @letters_picked << letter
      win_check(@guesses)

      return true
    else
      return false
    end
  end

  def display_board(guesses)
    board = ""
    guesses.each { |g|
      if g == nil
        board += "_ "
      else
        board += "#{g} "
      end
    }
    puts board
  end

  def win_check(guesses)
    if guesses == @word
      puts " " 
      puts "#{@word.join(" ") }" 
      puts " " 
      puts "HOLY SHIT, YOU WON, YOU ACTUALLY WON!"
      exit
    end
  end

  def letter_check(letter)

    #fail if more that 1 character
    if letter.length!=1
      puts "Error: Not a single character"
      return false

    #fail if already chosen
    elsif @letters_picked.include?(letter)
      puts "Error: Letter already picked."
      return false

    #fail if not letter or Key
    elsif !letter.match?(/[A-Z?12]/) 
      puts "Error: Not a letter."
      return false

    #Else -> Looks good to go.
    else
      return true
    end
  end

  def wrong_checker(wrongs)
    if (wrongs == @total_wrongs)
      puts " "
      puts "\nYou have gotten #{@total_wrongs} wrong answers.\nGAME OVER DUDE!  \nDo not pass go.  \nGo be sad!"
      puts ""
      puts "The correct answer was #{@word.join}"
      exit
    else
      return false
    end
  end

  def insert_guess(letter)
    # Find all locations of letter in @word
    letter_locations=@word.each_index.select{|i| @word[i] == letter}
    if letter_locations.empty?
      @wrongs+=1
    else
    letter_locations.each { |index|
      @guesses[index] = letter
    }
    end
  end

  def print_instructions
    puts " "
    puts "? = Instructions"
    puts "1 = Save Game"
    puts "2 = Load Game"
    puts "0 = EXIT"
  end

  def save_load_game(sl)
    Dir.mkdir(@dir) unless Dir.exist?(@dir)
    if sl=="1"
      # Save to File
      filename = "saves/hm_save.txt"

      File.write(filename, JSON.generate([@turn, @word, @wrongs, @letters_picked, @guesses]))
      puts " "
      puts "SAVE GAME"
    else
      
      # Load File
      filename = "saves/hm_save.txt"
      @turn, @word, @wrongs, @letters_picked, @guesses = JSON.parse(File.read(filename))
      puts " "
      puts "LOAD GAME"
    end
  end

end

