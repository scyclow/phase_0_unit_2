# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself, with: ].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
#create Pez Class
	#initialize with variable @chamber (an array containing each flavor)
	#def pez_count
		#@chamber.length
	#def eject 
		#@chamber.pop
	#def add_pez ( pez_flavor )
		#@chamber.push (pez_flavor) 
	#def see_all_pez
		#p @chamber


# 3. Initial Solution

class PezDispenser
	def initialize(flavors)
		@chamber = flavors
	end

	def pez_count
		@chamber.size
	end

	def get_pez
		@chamber.pop
	end

	def add_pez(flavor)
		@chamber.push(flavor)
	end

	def see_all_pez
		@chamber
	end
end
 


# 4. Refactored Solution


#This is fairly straight forward. I don't see any room for refactoring here.



# 1. DRIVER TESTS GO BELOW THIS LINE

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry)
super_mario = PezDispenser.new(flavors)
# puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
# puts "Here's a look inside the dispenser:"  
# puts super_mario.see_all_pez 
# puts "Adding a purple pez."
# super_mario.add_pez("purple")   # mmmmm, purple flavor
# puts "Now you have #{super_mario.pez_count} pez!"
# puts "Oh, you want one do you?"
# puts "The pez flavor you got is: #{super_mario.get_pez}"
# puts "Now you have #{super_mario.pez_count} pez!"

def assert actual, expected, message
	display message
	p actual==expected || error(expected, actual)
end

def display message
	puts "^"*40
	puts message
end

def error expected, actual
	puts "ERROR: Expected #{expected}, but got #{actual}"
end

assert flavors.length, super_mario.pez_count, "Number of PEZs lines up"
assert flavors, super_mario.see_all_pez, "Lists all PEZ flavors"
assert flavors[-1], super_mario.get_pez, "Returns the last PEZ in the list"
super_mario.add_pez("purple")
assert flavors.length, super_mario.pez_count, "Number of PEZs lines up after new PEZ added"
assert flavors[-1], super_mario.see_all_pez[-1], "Returns the last PEZ in the list"




# 5. Reflection 
# This challenge was actually kind of boring. I couldn't even All of the methods manipulate the same instance variable. The trick here is just knowing the appropriate ruby methods to rebrand as class methods.
#One interesting thing I learned here is that the above class actually modifies the flavors array. I'm not sure why this happens. I guess it happens because setting @chamber = flavors points the instance variable towards the original array...and when I call a method on @chamber, it's really calling it on flavors. If I didn't want this to happen, I suppose I could just set @chamber = flavors.copy.