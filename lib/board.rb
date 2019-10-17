require_relative 'board_case'
require_relative 'show'

class Board
  attr_accessor :cases
  
  def initialize
    @cases = []
    
    pos = [
      'A1', 'A2', 'A3',
      'B1', 'B2', 'B3',
      'C1', 'C2', 'C3'
    ]
    
    9.times do |i|
      @cases << BoardCase.new(' ', pos[i])
    end
  end
  
  def play_turn(player)
    puts "C'est le tour de " + player.name + "!"
    print "-> "
    commande = gets.chomp
    
    @cases.each do |bcase|
      if bcase.pos == commande
        bcase.value = player.symbole
      end
    end
    
  end
  
  def victory?
    
  end
  
end
