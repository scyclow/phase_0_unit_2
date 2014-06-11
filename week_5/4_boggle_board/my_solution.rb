# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself, with: ].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Write a method that takes a row number and returns all the elements in the row.

# Pseudocode
# def get_row ( row )
	# return the element in the boggle board array corresponding to the row number. This, itself, should be an array

# Initial Solution
<<-INITIAL
class Array
	def get_row(row)
		self[row]
	end
end
INITIAL

# Refactored Solution
class Array
	def get_row(row)
		self[row]
	end
end

# DRIVER TESTS GO BELOW THIS LINE
boggle_board.get_row(0) == ["b", "r", "a", "e"]
boggle_board.get_row(1) == ["i", "o", "d", "t"]
boggle_board.get_row(2) == ["e", "c", "l", "r"]
boggle_board.get_row(3) == ["t", "a", "k", "e"]

# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a column number and returns all the elements in the column.  

# Pseudocode
# def get col (col)
	# create an empty array
	# iterate through all arrays in the boggle board array
	# take each element at the position specified by col, and put it into the empty array
	# return the new array

# Initial Solution
<<-INITIAL2
class Array
	def get_col(col)
		column = []
		self.each {|x| column << x[col]}
		column
	end
end
INITIAL2

# Refactored Solution
class Array
	def get_col(col)
		self.inject([]) {|column, x| column << x[col]}
	end
end

# DRIVER TESTS GO BELOW THIS LINE
boggle_board.get_col(0) == %w{b i e t}
boggle_board.get_col(1) == %w{r o c a}
boggle_board.get_col(2) == %w{a d l k}
boggle_board.get_col(3) == %w{e t r e}



# Reflection 
# I was shocked to learn that, after two months of coding in ruby, you could not access local variables within functions that were declared outsie the function. I understand not being able to access local variables from other fucntions, but I don't get why I couldn't access the boggle_board variable from with in the function. In Python, you could do this. 
# I was also confused about the directions here. The directions did not state that I was supposed to add anything to the array class (on the contrary, the examples given call the method as a stand-alone function). But given the weird variable scope in ruby, I don't see any other way to do it. 

