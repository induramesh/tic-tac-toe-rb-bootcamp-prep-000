#winning combinations
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def turn(board)
  #get user input
  puts "Please enter 1-9:"
  input = gets.strip
  #convert input to index using helper method
  index = input_to_index(input)
  #if index is valid make the move with input using helper methods
  if valid_move?(board,index) == true
    move(board,index,value="X")
    display_board(board)
  #else prompt user to enter input again until correct / rinse & repeat
 else
    puts "Please enter 1-9:"
    input = gets.strip 
 end 
end

# helper method: #valid_move? 
def valid_move?(board,index)
  if (0..8).include?(index) && position_taken?(board,index) == false
    true
  else
    false 
  end
end 

# helper method: #position_taken? 
def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false 
  else
    true 
  end 
end 

# helper method: #move 
def move(board,index,value="X")
  board[index] = value 
end 

# helper method: #input_to_index
def input_to_index(input)
  if (0..10).include? input.to_i
    input.to_i - 1
  else
    -1
  end
end 
  
# helper method: #display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end # counts the length of the board selecting the X's and O's that are filled
def turn_count(board)
   board.select{|a| a=="X" || a=="O"}.length
end

# displays the current player based on turn count
def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end 
end 

# Helper Method I didn't use this at all oops 
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def won? (board)
   result = WIN_COMBINATIONS.map do |wincombo| 
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X" 
      wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O" 
      wincombo
    else
      false
    end 
   end 
    if result.all?{ |wincombo| wincombo == false}
      false
    else
      result.delete(false)
      result.flatten
    end   
end 


def full? (board)
  if board.include?("") || board.include?(" ")
    false
  else
    true
  end 
end

def draw? (board)
  if won?(board) != false
    false
  elsif full?(board)
    true 
  else
    false
  end 
end 

def over? (board)
  if won?(board) != false
    true
  elsif draw?(board)
    true
  else
    false
  end 
end 

def winner (board)
  if won?(board) == false
    nil
  elsif board.count("X") > board.count("O")
    "X"
  else
    "O"
  end 
end 