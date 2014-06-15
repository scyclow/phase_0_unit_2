# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: string of RPN expression
# Output: the solution to the RPN expression
# Steps:

# initialize class 
	#create empty instance variable, @rpn
	#create new method, evaluate, which accepts a string
		#prep
		#eval
	#create new method, prep
		#split string into an array
		#for each item in the array,
			#if a number, call to_i
			#if an operator, change to the operator as a symbol
		#save new array as @rpn
	#create new method, eval
		#iterate through @rpn with index.
			#if object is a symbol, use it to operate on previous two items in the array (using the index)
			#delete the three items from the array, replace with the evaluated answer.

# 3. Initial Solution
<<-Initial
class RPNCalculator
  def initialize
  	@rpn = nil
  end
  def evaluate(input)
  	raise ArgumentError.new("Input must be a string") unless input.is_a? String
  	prep(input)
  	eval
  end

  private
  def prep(string)
  	@rpn = string.split.map do|n| 
  		if n == '+' || n=='-' || n=='*'
  			n.to_sym 
  		else
  			n.to_i
  		end
  	end
  end
  def eval
	until @rpn.length == 1
		@rpn.each_with_index do |obj, i|
			if obj.is_a? Symbol
				@rpn[i] = @rpn[i-2].send(obj, @rpn[i-1])
				@rpn[i-1], @rpn[i-2] = nil, nil
				@rpn.delete(nil)
				break
			end
		end
  	end
  	@rpn[0]
  end
end

Initial


# 4. Refactored Solution

class RPNCalculator
  def initialize
  	@rpn = nil
  end
  def evaluate(input)
  	raise ArgumentError.new("Input must be a string") unless input.is_a? String
  	prep(input)
  	eval
  end

  private
  def prep(string)
  	@rpn = string.split.map do|n| 
  		case n
  		when '+', '-', '*' then n.to_sym 
  		else n.to_i
  		end
  	end
  end
  
  def eval
	until @rpn.length == 1
		pare_down
  	end
  	@rpn[0]
  end
  
  def pare_down
	@rpn.each_with_index do |obj, i|
		if obj.is_a? Symbol
			@rpn[i] = @rpn[i-2].send(obj, @rpn[i-1])
			@rpn.delete_at(i-1); @rpn.delete_at(i-2)
			break
		end
	end
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE
r = RPNCalculator.new
r.evaluate('-1') == -1
r.evaluate('0') == 0
r.evaluate('1 1 +') == 1+1
r.evaluate('1 -1 +') == 0
r.evaluate('1 -1 +') == 0
r.evaluate('1 2 3 4 + + +') == 1+2+3+4
r.evaluate('1 2 + 3 4 + *') == (2 + 1) * (4 + 3)

begin
	r.evaluate(5)
rescue ArgumentError
	true
end


# 5. Reflection 
# This was one fo the best exercises so far. The problem itself was fairly complex, and it required me to learn some new techniques.
#For example, I remember reading that you could pass methods as symbols in ruby, so turning them into a symbol from a string was the first solution that came ot mind for me. However, actually passing them as a symbol was a bit of a challenge, and required some research.
# I also had to do some research on how to manipulate the array with access to the index. I originally tried an inject_with_index type method, but it proved too complicated.
# There has to be a way to refactor this a bit more. Having to put pare_down in an until loop looks dumb. 
# In any case, this challenge helped improve my ability to iterate with indeces.