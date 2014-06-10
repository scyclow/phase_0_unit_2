# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: number of sides
# Output: either the number of sides or a random number between 1 and the number of sides
# Steps:
# initialize the object with a 'sides' variable. If sides is less than 1, raise an ArgumentError.
# set an instance variable to sides if it is 6 or greater.
# create a sides method that returns the sides instance variable
# create a roll method that chooses a random number between 1 and sides

# 3. Initial Solution

class Die
  def initialize(sides=6)
    raise ArgumentError.new('Die must be at least 1 side') if sides < 1
    @sides = sides
  end
  
  def sides
    return @sides
  end
  
  def roll
    rand(1..@sides)
  end
end



# 4. Refactored Solution
class Die
	attr_reader :sides

	def initialize(sides=6)
		raise ArgumentError.new('Die must be at least 1 side') if sides < 1
		@sides = sides
	end

	def roll
		rand(1..@sides)
	end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

begin
	Die.new(0)
rescue ArgumentError
	true
end

begin
	Die.new(-1)
rescue ArgumentError
	true
end

sides = rand(6..800)
d = Die.new(sides)
d.sides == sides

(1..sides).include? d.roll

p 'OK'



# 5. Reflection 

# Pretty straightforward exercise. I think I learned more about error handling in Ruby than I did about classes. 
#After refactoring my code, I was looking up how to check for errors under certain criteria. I ended up finding a question on stack overflow that copied this exercise exactly
#http://stackoverflow.com/questions/21353945/is-there-a-way-to-test-argument-errors-from-within-a-method-to-return-true-or-fa
