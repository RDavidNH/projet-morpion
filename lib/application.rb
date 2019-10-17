require_relative 'game'
require_relative 'board'

class Application
  
  def perform
    
    my_game = Game.new
    
    while my_game.status == "on going" && my_game.counter < 9
      my_game.turn
    end
    
    my_game.game_end

  end
end
