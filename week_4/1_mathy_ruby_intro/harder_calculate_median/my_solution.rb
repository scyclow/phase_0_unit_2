# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# define a method called 'median' with one parameter...array
	# sort the array
	# find the length of the array
	# if the length is an odd number:
		# divide the length by 2, and round up
		# return the element at this place in the array
	# else
		#divide the array's length by 2
		#return the average of the element in this place, and the element in the next place

# 2. Initial Solution

def median(array)
	unless array.length % 2 == 0
		array.sort[array.length/2]
	else
		(array.sort[array.length/2].to_f+array.sort[(array.length/2)-1])/2
	end
end

# 3. Refactored Solution
def median(array)
	array.sort!
	mid = array.length/2
	array.length.odd? ? array[mid] : (array[mid]+array[mid-1])/2.0 
end


# 4. Reflection 
# This wasn't very hard overall. I found myself thinking about the solution faster than I could pseudocode. Then I found myself thinking about refactoring while I was writing the initial solution.
# Originally I refactored the solution such that it took up more lines of code, but was clearer. Then I refactored to it's current form.
# I'm not sure if this is clearer than the original refactor, but it's much shorter. I could probably fit it into one line, but then it would be unreadable:
# array.size.odd? ? array.sort![array.size/2] : (array[array.size/2]+array[(array.size/2)-1])/2.0 
# 
