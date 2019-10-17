require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game

  attr_accessor :current_player, :status, :board, :players, :counter

  def initialize
    @players = []
    @counter = 0
    
    puts "Entrez nom du joueur 1"
    name1 = gets.chomp
    puts "Entrez nom du joueur 2"
    name2 = gets.chomp
    
    @players << Player.new(name1, 'X')
    @players << Player.new(name2, 'O')
    
    @status = "on going"
    @board = Board.new
    @current_player = @players[0]
    
    puts "=" * 25
    puts "Commencez!!!!!"
    Show.new.show_board(@board)
  end
  
  def turn
    
    @board.play_turn(@current_player)
    
    if @current_player == @players[0]
      @current_player = @players[1]
    elsif @current_player = @players[1]
      @current_player = @players[0]
    end
    
    puts "Tour #" + (@counter + 1).to_s
    
    Show.new.show_board(@board)
    
    @counter += 1
  end
  
  def new_round
    
  
  end
  
  def game_end
    puts "Partie terminéeee!!!"
    
    puts "Que voulez vous faire?"
    puts "-" * 35
    
    
  end

end
