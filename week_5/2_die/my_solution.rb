# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: an array of strings
# Output: a property equal to the number of sides, and a method that spits out a random side
# Steps:
# initialize the object with a 'labels' variable. 
	# if labels is not an array,  raise an argument error
	# elsif labels is an empty array, raise ana rgument error
	# else set labels equal to an instance variable.
# sides = labels.length
# roll returns a random element from the array using sample.


# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.class != Array
  		raise ArgumentError.new("not an array")
  	elsif labels.empty?
  		raise ArgumentError.new("array is empty")
  	else
  		@labels = labels
  	end
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels.sample
  end
end



# 4. Refactored Solution
class Die
  attr_accessor :sides
  
  def initialize(labels)
  	if labels.class != Array
  		raise ArgumentError.new("not an array")
  	elsif labels.empty?
  		raise ArgumentError.new("array is empty")
  	else
  		@labels = labels
  		@sides = @labels.length
  	end
  end

  def roll
  	@labels.sample
  end
end





# 1. DRIVER TESTS GO BELOW THIS LINE

begin
	Die.new(0)
rescue ArgumentError => e
	e.message == "not an array"
end

begin
	Die.new([])
rescue ArgumentError => e
	e.message == "array is empty"
end


labels = %w{q w e r t y u i o p}
d = Die.new(labels)
d.sides == labels.length

labels.include? d.roll

p 'OK'


# 5. Reflection 
# This one was also fairly easy. It was very similar to the last exercise. I forgot to put the @ in front of the instance variables on the firet go-around. Aside from that, no issues.
