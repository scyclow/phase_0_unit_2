# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself ].

# 1. Pseudocode

#define a function called 'mode' that accepts the parameter 'array'
	# create a new hash with a default value of 0
	# iterate through array
		# for each item, add 1 to hash[item]
	# sort the hash by values
	# return a list of the keys with the same value as the last value


# 2. Initial Solution
def mode(array)
	entries = Hash.new(0)
	array.each {|key| entries[key] += 1}
	entries.select {|key, value| value == entries.values.sort.last}.keys
end



# 3. Refactored Solution

def mode(array)
	entries = Hash.new(0)
	array.each {|key| entries[key] += 1}
	entries.select {|key, value| value == entries.max}.keys
end


# 4. Reflection 