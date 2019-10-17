def render_case(check = 0)
  #return "-" * 5 + check ? '| x |' : '|   |' + "-" * 5
  return check != 0 ? "[x]" : "[ ]"
end

#puts render_case()

data = {
  'A' => [0, 0, 0],
  'B' => [0, 0, 0],
  'C' => [0, 0, 0]
}

win = [
  'A' => [0, 1, 2],
  'B' => [0, 1, 2],

]

#puts win == data

def win?()
  win.each do |combination|
    
  end
end

#puts [true, true, true] == data[0]

def render_row(row_data)
  3.times do |i|
    print render_case(row_data[i])
  end
end
  
def render_board(data)
  a = "ABC"
  puts "  1  2  3"
  3.times do |i|
    print a[i]
    render_row(data[a[i]])
    puts ""
  end
end


def move(data, pos_row, pos_col, value)
  pos_col -= 1
  data[pos_row][pos_col] = value
end

move(data, 'A', 2, true)
move(data, 'C', 1, true)

render_board(data)
