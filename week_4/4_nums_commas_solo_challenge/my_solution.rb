# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input? 
	# a number containing several digits.
# What is the output? (i.e. What should the code return?)
	#a string, seperating the input number with commas
# What are the steps needed to solve the problem?

#define a function called seperate_comma
	#turn the input into a string
	#step through the input backwards 
	# every three digits, insert a comma
	#return the string



# 2. Initial Solution
=begin
def separate_comma(input)
	string = input.to_s
	inc=0
	(string.length-1).downto(0) {|i| unless inc==2 then inc+=1 else string.insert(i,','); inc=0 end}
	string[0]='' if string[0] == ','
	string
end
=end



# 3. Refactored Solution

#same as above, but a bit more readable
def separate_comma(input)
	string = input.to_s
	inc = 0
	(string.size - 1).downto 0 do |i|
		if inc == 2 
			string.insert i, ','
			inc = 0 
		else  
			inc += 1 
		end
	end
	string[0] = '' if string[0] == ','
	string
end



# 4. Reflection 
# It really annoys me that ruby does not have a way of iterating in steps. I originally tried to iterate in steps using a range, referencing the index of the input, but ranges can't go backward. So, I came up with this stupid idea.
# In all, this is a pretty straight forward exercise. But, this is the first time I'm really dissapointed with ruby's library. It is sorely lacking a function to step through an iterable. Range#step doesn't cut it.

#0. Driver Test
separate_comma(10000000) == '10,000,000'
separate_comma(1000000) == '1,000,000'
separate_comma(100000) == '100,000'
separate_comma(10000) == '10,000'
separate_comma(100) == '100'