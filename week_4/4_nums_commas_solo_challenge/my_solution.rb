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

def separate_comma(input)
	string = input.to_s
	i = string.length - 3
	while i > 0
		string.insert( i , "," )
		i -= 3
	end
	string
end


# 4. Reflection 
# It really annoys me that ruby does not have a way of iterating in steps. I originally tried to iterate in steps using a range, referencing the index of the input, but ranges can't go backward. So, I came up with this stupid idea.
# In all, this is a pretty straight forward exercise. But, this is the first time I'm really dissapointed with ruby's library. It is sorely lacking a function to step through an iterable. Range#step doesn't cut it.
# i wonder if there is a more elegent way of implimenting my solultion. Using an incrimenter seems like a sloppy way to keep track of where you are.
# I had one idea for a relatively elegent solution, but can't figure out a major kink: 

# def separate_comma(input)
	# string = input.to_s.reverse  
	# (3...string.size).step(4) {|i| string.insert i, ','}  
	# string.reverse  
# end  

# It works most of the time, but occasionally screws up around the front of the number. 

# After some thought, I realized that my original approach was kind of stupid. As long as I was using an incrementer, I figured I'd just use a while loop. 
# At the end of the day, I guess the while loop solution does the trick. It is a free-roaming incrementer, unbound by the length of any object it's modifying. 
# I guess it's good that I struggled with the refactoring a bit. It helped me rediscover the while loop. 
# Nevertheless, I think it's somewhat of a syntactical failure on ruby's part that there are no methods to make this straighforward. I haven't found myself saying this very much, but this challenge would have been a lot easier in Python. The Python range() function is much more versatile, allowing for steps and going in reverse order. In addition, its slicing is much more coherent. Stepping through an array is as simple as [::2].

#0. Driver Test
separate_comma(10000000) == '10,000,000'
separate_comma(1000000) == '1,000,000'
separate_comma(100000) == '100,000'
separate_comma(10000) == '10,000'
separate_comma(100) == '100'