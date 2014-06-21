# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself, with: ].


# Original Solution
=begin
class CreditCard
	def initialize(card_num)
		@number = card_num
		@num_arr = @number.to_s.split(//).map(&:to_i)
		if @num_arr.length != 16
			raise ArgumentError
		end
	end

	def check_card
		convert_num = @num_arr.map.with_index {|x,i| i % 2 == 0 ? x*2 : x}.map!{|x| x.to_s}
		luhn_prep = convert_num.join("").to_s.split(//).map(&:to_i)
		luhn_check = luhn_prep.inject(:+)
		if luhn_check % 10 == 0
			return true
		else
			return false
		end
	end
end

=end

# Refactored Solution
class CreditCard
	def initialize(card_num)
		@number = card_num.to_s						#moved this to the top, called to_s
		raise ArgumentError if @number.length != 16 #fit this into one line
	end


	 #took some of the above lines and put them into seperate methods
	private
	def prep(input) 									#defined and named a method to take care of each procedure
		input.split(//).map(&:to_i) #set the instance variable equal to each of these lines, so method is destructive
	end

	def convert_num
		@number = prep(@number).map.with_index {|x,i| i.odd? ? (x*2).to_s : x.to_s} #deleted .map!{|x| x.to_s}
	end

	def luhn_check
		prep(@number.join).inject(:+) # used the prep method i defined above instead of making a new preped variable. 
	end

	public
	def check_card # the methodology is still a bit opaque, but it I think the code is a bit more maintainable. 
		convert_num
		luhn_check % 10 == 0 ? true : false
	end
end



# DRIVER TESTS GO BELOW THIS LINE

good_card = 4408041234567893
bad_card = 4408041234567892

def assert_card input, expected, message
	p "*"*50
	p message
	card = CreditCard.new(input)
	result = card.check_card == expected 
	p result || "ERROR, expected #{expected}, but got #{result}"
end

assert_card good_card, true, "Returns true when given a good card number"
assert_card bad_card, false, "Returns false when given a bad card number"




# Reflection 

#For me, the big trouble here has been testing the code. For some reason, copying and pasting this code into pry (in the terminal) returns a bug-free output. But, when I try to run it within Sublime, it does nto recognize the #with_index method, and spits out an error. 
# I'm not sure why this happens. It might be because Sublime is running a different version of Ruby.
# Overall, I think the original codes was a bit clearer about what it did, but was less maintainable. I tried to split it up into a bunch of different methods. This way, if you want to change one part of the process, it's easier to do so. Although, the use of prep might lead to some fragility.
# I also got lazy in writing assert code here. I just lumber it all into one method since I only had one kind fo test.