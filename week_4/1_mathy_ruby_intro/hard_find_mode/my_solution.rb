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
	entries.select {|key, value| value == entries.values.max}.keys
end


# 4. Reflection 
# I remember doing the hash.new(0) method to count things from a codecademy exercise, so I can't take total credit for that. 
# I had some trouble with the third line of the function...writing it initially and refactoring it. Originally I tried sorting the hash, and then add the value of the last item to a seperate array. but this was problematic.
# After some research, I figured that I could just use the select method instead of creating a seperate array. And after looking to some hash methods, I realized I could pull out the keys from the select method.
# It neve occured to me to refactor the first part, which creates the hash. But I saw someone else use the inject method to the effect of:
	# entries = array.inject(Hash.new(0)) {|hash, key| hash[key] += 1}

# In all, I figured most of this out by browsing the Hash document with an idea of methods that work on arrays.