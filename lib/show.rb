class Show

  def show_board(board)
    puts "   1  2  3"
    
    board.cases.each_with_index do |bcase, i|
      print "A " if i == 0
      print "B " if i == 3
      print "C " if i == 6
      print "[" + bcase.value + "]"
      puts "" if (i+1) % 3 == 0 
    end
    
  end
end
