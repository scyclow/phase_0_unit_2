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
		(array.sort[array.length/2]+array.sort[(array.length/2)+1])/2.0
	end
end


# 3. Refactored Solution



# 4. Reflection 