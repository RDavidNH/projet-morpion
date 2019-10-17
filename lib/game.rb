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
    
    # ask for the players names
    puts "Entrez nom du joueur 1"
    name1 = gets.chomp
    puts "Entrez nom du joueur 2"
    name2 = gets.chomp
    
    @players << Player.new(name1, 'X')
    @players << Player.new(name2, 'O')
    
    # set the current player to player 1
    @current_player = @players[0]
    
    puts "=" * 25
    puts "Commencez!!!!!"
    # display the board for the first time
    Show.new.show_board(@board)
  end
  
  def turn
    # start the game with the current player
    @board.play_turn(@current_player)
    
    # display current turn number
    puts "Tour ##{@counter + 1}"
    
    # display the board every turn
    Show.new.show_board(@board)
    
    # check if the current player has won
    if @board.victory?(@current_player)
      puts "-" * 30
      puts @current_player.name + " IS THE WINNEEEER!!!"
      puts "*" * 30
      # set game status to finished
      @status = "finished"
    end
    
    # change player after each turn
    if @current_player == @players[0]
      @current_player = @players[1]
    elsif @current_player = @players[1]
      @current_player = @players[0]
    end
    
    # count the turn
    @counter += 1
  end
  
  def new_round
    
  
  end
  
  def game_end
    puts "=" * 35
    puts "Partie terminéeee!!!"
    puts "MATCH NUL!" unless @board.victory?(@current_player) 
    puts "*" * 35
    puts "Que voulez vous faire?"
    puts "1 - Rejouer :D"
    puts "2 - Nouveau jeu"
    puts "3 - Quitter :("
    
    cmd = gets.chomp
    
    if cmd == "3"
      @status = "quit"
      puts "Byee byeeee!!!!"
    end
    
  end

end
