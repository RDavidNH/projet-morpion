require_relative 'game'
require_relative 'board'

class Application
  
  def perform
    
    my_game = Game.new
    
    while my_game.status != 'quit'
      # continue playing
      my_game.turn if my_game.status == "on going" 
      
      # display menu if game is finished
      my_game.game_end if my_game.status == "finished" 
      
      # create new game if player select "Nouveau jeu"
      if my_game.status == "new_game"
        puts "=" * 35
        puts "NOUVEAU JEU!!!!!"
        my_game = Game.new 
      end
    end
    
  end
end
