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
def seperate_comma(input)
	string = input.to_s
	inc=0
	(string.length-1).downto(0) {|i| unless inc==2 then inc+=1 else string.insert(i,','); inc=0 end}
	string[0]='' if string[0] == ','
	string
end




# 3. Refactored Solution



# 4. Reflection 
# It really annoys me that ruby does not have a way of iterating through an iterable in steps. I originally tried to iterate in steps using a range to reference the index of the input, but ranges don't go backward.

#0. Driver Test
seperate_comma(10000000) == '10,000,000'
seperate_comma(1000000) == '1,000,000'
seperate_comma(100000) == '100,000'
seperate_comma(10000) == '10,000'
seperate_comma(100) == '100'