require_relative 'board_case'
require_relative 'show'

class Board
  # array of board cases
  attr_accessor :cases, :pos, :turn_error
  
  def initialize
    @cases = []
    @turn_error = false
    
    # set position of cases
    @pos = [
      'A1', 'A2', 'A3',
      'B1', 'B2', 'B3',
      'C1', 'C2', 'C3'
    ]
    
    # create 9 cases
    9.times do |i|
      @cases << BoardCase.new(' ', @pos[i])
    end
  end
  
  def play_turn(player)
  
    @turn_error = false
    
    # ask a player for a command on his turn
    puts "C'est le tour de " + player.name + "! [" + player.symbole + "]"
    print "-> "
    command = gets.chomp
    
    # search for the selected case and replace its value if it is empty
    @cases.each do |bcase|
      if bcase.pos == command && bcase.value == ' '
        bcase.value = player.symbole
      elsif bcase.pos == command && bcase.value != ' '
        puts '!!!!' * 12
        puts "Case déjà utilisée, choisissez une autre case!"
        puts '!!!!' * 12
        @turn_error = true
      elsif !@pos.include?(command)
        puts "!" * 35
        puts "COMMANDE INCORRECT!!!"
        puts "!" * 35
        @turn_error = true
        break
      end
    end
    
  end
  
  def victory?(player)
    
    winner = [
      # horizontal
      @cases[0].value == player.symbole && @cases[1].value == player.symbole && @cases[2].value == player.symbole,
      @cases[3].value == player.symbole && @cases[4].value == player.symbole && @cases[5].value == player.symbole,
      @cases[6].value == player.symbole && @cases[7].value == player.symbole && @cases[8].value == player.symbole,
      # vertical
      @cases[0].value == player.symbole && @cases[3].value == player.symbole && @cases[6].value == player.symbole,
      @cases[1].value == player.symbole && @cases[4].value == player.symbole && @cases[7].value == player.symbole,
      @cases[2].value == player.symbole && @cases[5].value == player.symbole && @cases[8].value == player.symbole,
      # diagonal
      @cases[0].value == player.symbole && @cases[4].value == player.symbole && @cases[8].value == player.symbole,
      @cases[2].value == player.symbole && @cases[4].value == player.symbole && @cases[6].value == player.symbole
    ]
    
    # test all the winner combination
    # return true if there is a winner
    winner.each do |win|
      if win
        return true
      end
    end
    
    # return false if no winner
    return false
  end
  
end
