# U2.W6: Create a BoggleBoard Class


# I worked on this challenge with Michael Kirlin.


# 2. Pseudocode
# Initialize a class that takes a 2D array and sets it as an instance variable
# Define get_col and get_row to call on the array that is being initialized
# get_row: call the index of the input
# get_col: repeat the get_col from last week's challenge
# New method: create_word, takes a series of coordinates as input and outputs the letters at those coordinates 
# instance_variable[coord1][coord2]


# 3. Initial Solution
<<-INITIAL
class BoggleBoard
  def initialize(array) # array should be 2D
    @board = array
  end
  
  def get_row(row)
    if row > @board.length
      raise ArgumentError.new
    else
      @board[row]
    end
  end
  
  def get_col(col)
    if col > board[0].length
      raise ArgumentError.new
    else
      @board.inject([]) { |column, x| column << x[col] }
    end
  end
  
  def create_word(*coordinates)
    output = []
    coordinates.each { |coordinates| a, b = coordinates; output << @board[a][b] } 
    return output
  end
end
INITIAL

 


# 4. Refactored Solution
class BoggleBoard
  def initialize(array) # array should be 2D
    @board = array
  end
  
  def get_row(row)
    @board[row]
  end
  
  def get_col(col)
    @board.inject([]) { |column, x| column << x[col] }
  end
  
  def create_word(*coordinates)
    coordinates.inject([]) {|output, coordinates|  a, b = coordinates; output << @board[a][b]} 
  end

  def get_diagonal(coord_start, coord_end)
  	x_start, y_start = coord_start
  	x_end, y_end = coord_end

  	x_direction = (x_start < x_end) ? 1 : -1
  	y_direction = (y_start < y_end) ? 1 : -1

  	diagonal =[] 
  	until (x_start == x_end+x_direction) || (y_start == y_end+y_direction) 
	  	diagonal << @board[x_start][y_start]
	  	x_start += x_direction
	  	y_start += y_direction
	end
	diagonal
  end

end




# 1. DRIVER TESTS GO BELOW THIS LINE
def display message, test
    puts "#"*50
    puts message
    puts test
end

def assert expected, actual, message
    display message, (actual==expected)
end

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)

# create driver test code to retrieve a value at a coordinate here:
assert ["k"], boggle_board.create_word([3,2]), "returns 'k'"
# implement tests for each of the methods here:

dice_grid.each_with_index {|row, index| assert row, boggle_board.get_row(index), "calls row #{index} of the boggle board"}
assert ["e", "t", "r", "e"], boggle_board.get_col(3), "calls column 3 of the boggle board"
assert ["r", "o", "c", "a"], boggle_board.get_col(1), "calls column 1 of the boggle board"
assert ["c", "o", "d", "e"], boggle_board.create_word([2,1], [1,1], [1,2], [0,3]), "returns array that says code"
assert %w{b o l e}, boggle_board.get_diagonal([0,0],[3,3]), "returns diagonal from top left to bottom right"
assert %w{t c d e}, boggle_board.get_diagonal([3,0],[0,3]), "returns diagonal from bottom left to top right"

# 5. Reflection 
#This challenge started out easy, but we weren't able to figure out how to do the diagnol method. I came back to the problem the next day and figured it out, but it's not pretty. There's probably a way to refactor the method, or at least split it up into a couple different methods. 
# Another thign we had trouble with was testing errors. I had previously, and successfully, tested errors using begin/resuce. But this time, the driver tests never caught the error. I'll have to look more into this.


