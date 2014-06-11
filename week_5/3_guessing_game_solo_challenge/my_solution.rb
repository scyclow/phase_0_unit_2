# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:
# initialize guessing game class with one parameter: answer
	# set attr_reader for solved?
	# set answer equal to instance variable
	# create an instnace variable solved?, and set it equal to false
#create a method called guess, taking a guess param
	#if guess equals answer, return :correct and set solved? = true
	# elsif higher than answer, return :high, 
	# else return :low


# 3. Initial Solution
<<-INITIAL
class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(g)
  	if g == @answer
  		@solved = true; :correct
  	elsif g > @answer
  		:high
  	else
  		:low
  	end
  end

  def solved?
  	@solved
  end
end
INITIAL



# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(g)
  	if g == @answer then @solved = true; :correct
  	elsif g > @answer then :high
  	else :low end
  end
  
  def solved?
  	@solved
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

game = GuessingGame.new(10)
game.solved? == false
game.guess(100) == :high
game.guess(0) == :low
game.guess(10) == :correct
game.solved? == true




# 5. Reflection 
# In this exercise, I learned that variables are not allowed to have a ? in them. 
# I also learned that, when trying to fit an else on one line, you don't use 'then'.