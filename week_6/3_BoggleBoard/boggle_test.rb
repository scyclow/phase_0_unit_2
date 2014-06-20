# Psuedocode

# Initialize a class that takes a 2D array and sets it as an instance variable
# Define get_col and get_row to call on the array that is being initialized
# get_row: call the index of the input
# get_col: repeat the get_col from last week's challenge
# New method: create_word, takes a series of coordinates as input and outputs the letters at those coordinates 
# instance_variable[coord1][coord2]

# class BoggleBoard
#   def initialize(array) # array should be 2D
#     @board = array
#   end
  
#   def get_row(row)
#     if row > @board.length
#       raise ArgumentError.new
#     else
#       @board[row]
#     end
#   end
  
#   def get_col(col)
#     if col > board[0].length
#       raise ArgumentError.new
#     else
#       @board.inject([]) { |column, x| column << x[col] }
#     end
#   end
  
#   def create_word(*coordinates)
#     output = []
#     coordinates.each { |coordinates| a, b = coordinates; output << @board[a][b] } 
#     return output
#   end
# end

# dice_grid = [["b", "r", "a", "e"],
#             ["i", "o", "d", "t"],
#             ["e", "c", "l", "r"],
#             ["t", "a", "k", "e"]]
 
# boggle_board = BoggleBoard.new(dice_grid)

# REFACTORED CODE

class BoggleBoard
  def initialize(array) # array should be 2D
    raise ArgumentError.new("You need to enter an array.") if array[0].is_a? Array
    @board = array
  end
  
  def get_row(row)
    raise ArgumentError.new
  end
  
  def get_col(col)
    raise ArgumentError.new if col > @board[0].length
    @board.inject([]) { |column, x| column << x[col] }
  end
  
  def create_word(*coordinates)
    coordinates.inject([]) { |output, coordinates|  a, b = coordinates; output << @board[a][b] } 
  end
  
  def get_diagonal(coord1, coord2)
    raise ArgumentError.new unless (coord1 == [0,0] && coord2 == [-1,-1]) || (coord1 == [0,-1] && coord2 == [-1,0])
    #x, y = coord1
    #print @board[x][y]
    #add 1 to x and y
    #repeat until x, y == coord2
    
    # iterate through array until 
    #use inject to push diagnols to new column
end

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)

# DRIVER TESTS
def display message, test
    puts "#"*50
    puts message
    puts test
end

def assert expected, actual, message
    display message, (actual==expected)
end

dice_grid.each_with_index {|row, index| assert row, boggle_board.get_row(index), "calls row #{index} of the boggle board"}
assert ["e", "t", "r", "e"], boggle_board.get_col(3), "calls column 3 of the boggle board"
assert ["r", "o", "c", "a"], boggle_board.get_col(1), "calls column 1 of the boggle board"
assert ["c", "o", "d", "e"], boggle_board.create_word([2,1], [1,1], [1,2], [0,3]), "returns array that says code"
assert ["k"], boggle_board.create_word([3,2]), "returns 'k'"
