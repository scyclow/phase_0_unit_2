# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

def assert 									
  raise "Assertion failed!" unless yield 	
end

name = "bettysue" 							
assert { name == "bettysue" }				
#assert { name == "billybob" }				

# 2. Pseudocode what happens when the code above runs
#defining an asset statement
	#raises an error unless a true block is passed to the function
# set name eql to "bettysue"
# passes a statement which evaluates to true; assert returns nil
# passes a statement which evaluates to false; assets raises an error.

# 3. Copy your selected challenge here
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



# 4. Convert your driver test code from that challenge into Assert Statements
def display input
	puts "#"*40
	puts input

end

def assert_eql actual, expected
	r = RPNCalculator.new
	display r.evaluate(actual) == expected
end


assert_eql '-1', -1
assert_eql '0', 0
assert_eql '1 1 +', 1+1
assert_eql '1 -1 +', 0
assert_eql '1 2 3 4 + + +', 1+2+3+4
assert_eql '1 2 + 3 4 + *', (2 + 1) * (4 + 3)


# 5. Reflection
# I just watched Shadi's lecture on assert statements, which was pretty interesting. I tried to complete the challenge using the same method he used. 
# I definitely see how this technique could be useful for larger projects, but it seems overly cumbersome for thigns this small. 
