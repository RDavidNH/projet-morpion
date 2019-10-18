require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game

  attr_accessor :current_player, :status, :board, :players, :counter

  def initialize
    @players = []
    @status = "on going"
    @board = Board.new
    @counter = 0
    
    puts "*" * 40
    puts "BIENVENU SUR NOTRE JEU DE MORPION :D"
    puts "*" * 40
    puts "Entrez les noms des joueurs pour commencer!"
    
    # ask for the players names
    puts "Entrez nom du joueur 1"
    print "> "
    name1 = gets.chomp
    puts "Entrez nom du joueur 2"
    print "> "
    name2 = gets.chomp
    
    @players << Player.new(name1, 'X')
    @players << Player.new(name2, 'O')
    
    # set the current player to player 1
    @current_player = @players[0]
    
    puts "=" * 25
    puts "Commencez le jeu!!!"
    # display the board for the first time
    Show.new.show_board(@board)
  end
  
  def turn
  
    puts ""
    
    # display current turn number
    puts "Tour ##{@counter + 1}"
    
    # start the game with the current player
    @board.play_turn(@current_player)
        
    # display the board every turn
    Show.new.show_board(@board)
    
    # check if the current player has won
    if @board.victory?(@current_player)
      puts "-" * 30
      puts "[" + @current_player.symbole + "] " + @current_player.name +  + " IS THE WINNEEEER!!!"
      puts "*" * 30
      # set game status to finished
      @status = "finished"
    end
    
    # stop game if it is the 9 turn and there is no winner
    # note: "counter" count from 0
    if @counter >= 8 && !@board.victory?(@current_player)
      puts "-" * 30
      puts "MATCH NUL!!!"
      puts "*" * 30
      # set game status to finished
      @status = "finished"
    end
    
    # if no error during a turn
    if not @board.turn_error
      # change player after each turn if no error
      if @current_player == @players[0]
        @current_player = @players[1]
      elsif @current_player = @players[1]
        @current_player = @players[0]
      end
      
      # count the turn
      @counter += 1
    end
    
    
  end
  
  def new_round
    # reset the board, the game status and the counter
    @board = Board.new
    @status = 'on going'
    @counter = 0
        
    puts "=" * 35
    puts "REJOUER!!!"
    
    # set the current player to player 1
    @current_player = @players[0]
    
    #puts "=" * 25
    #puts "Commencez!!!!!"
    
    # display the board for the first time
    Show.new.show_board(@board)

  end
  
  def game_end
    puts "=" * 35
    puts "Partie terminéeee!!!"
    # show "MATCH NUL" if no victory    
    #puts "MATCH NUL!" unless @board.victory?(@current_player)
    puts "*" * 35
    puts "Que voulez vous faire?"
    puts "1 - Rejouer :D"
    puts "2 - Nouveau jeu"
    puts "3 - Quitter :("
    
    # get command from player
    cmd = gets.chomp
    
    if cmd == "1"
      new_round
    elsif cmd == "2"
      @status = "new_game"
    elsif cmd == "3"
      @status = "quit"
      puts "Byee byeeee!!!!"
    end
    
  end

end
