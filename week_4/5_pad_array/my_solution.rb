# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# for the Array class, 
	# define a method called pad, accepting two paramaters: times and with. with is set to nil on default
		# create a variable called new array, equal to self
		# if times is negative or 0, return the array
		# 'times'.times, shove 'with' into the back of the array	
		# return new array
	# define a method called pad!, accepting two paramaters: times and with. with is set to nil on default
		# if times is negative or 0, return self
		# 'times'.times, shove 'with' into the back of self
		# return self


# 2. Initial Solution
<<-Initial

class Array
	def pad(times, with=nil)
		new_array = Array.new(self)
		return new_array if times <= self.length
		(times-self.length).times {new_array << with}
		new_array
	end
	def pad!(times, with=nil)
		return self if times <= self.length
		times.times {self << with}
		self
	end
end

Initial


# 3. Refactored Solution
class Array
	def pad(places, with=nil)
		return self+Array.new(places-self.length, with) unless places<=self.length
		Array.new(self)
	end
	def pad!(places, with=nil)
		(places-self.length).times {self << with} 
		self
	end
end


# 4. Reflection 
# the original solution came to me pretty quickly here, but I messed up by not reading the directions. I thought that pad was supposed to add the specified number of padding to the array.
