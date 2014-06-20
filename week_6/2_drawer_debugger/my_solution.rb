# U2.W6: Drawer Debugger


# I worked on this challenge [by myself, with: ].


# 2. Original Code

class Drawer

attr_reader :contents, :type, :opened

	# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@opened = true
		@type = "drawer"
	end

	def open
		@opened = true
		puts "You opened the drawer"
	end

	def close
		@opened = false
		puts "You closed the drawer"
	end 

	def add_item *items
		items.each do |item|
			@contents << item
			puts "You added a #{item.type}"
		end
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing?
		if @contents.include? item
			@contents.delete(item)
			puts "You removed #{item.type}"
			item
		else
			Silverware.new("hands")
		end
		
	end

	def dump  # what should this method return?
		@contents = []
		puts "Your dumped the drawer; it is now empty."
	end

	def view_contents
		puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end

class Silverware
	attr_reader :type, :clean

	# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
		puts "The #{type} is now dirty."
	end

	def clean_silverware
		@clean = true
		puts "The #{type} is now clean"
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
fork.eat

#BONUS SECTION
puts fork.clean
puts '$'*40
# DRIVER TESTS GO BELOW THIS LINE
def display message, test
	puts message
	puts test
	puts '^'*40
end

def assert_class thing, expected
	display "#{thing.type} is in the #{expected} class", (thing.class == expected)
end

def assert_clean utensil, expected
	modifier = (expected == false) ? "not " : ""

	display "#{utensil.type} is #{modifier}clean?", utensil.clean == expected
end

def assert_in_drawer thing, *utensils
	utensils.each {|ut| display "#{ut.type} is in the #{thing.type}", (thing.contents.include? ut)}
end

def assert_remove thing, utensil=nil
	thing.remove_item(utensil)
	display "#{thing.type} no longer displays #{utensil.type}", !(thing.contents.include? utensil)
end

def assert_dump thing
	thing.dump
	display "There's nothing left in the drawer.", thing.contents.empty?
end

def assert_open_closed thing, expected
	expected ? thing.open : thing.close
	modifier = (expected == false) ? "not " : ""
	display "#{thing.type} is #{modifier}open.", (thing.opened == expected)
end



drawer = Drawer.new
knife = Silverware.new('knife')
fork = Silverware.new('fork')
spoon = Silverware.new('spoon')

assert_class drawer, Drawer
assert_class knife, Silverware 
assert_class fork, Silverware 
assert_class spoon, Silverware 

drawer.add_item knife, spoon, fork

assert_in_drawer drawer, knife, spoon, fork

drawer.contents.each {|utensil| assert_clean utensil, true}
drawer.contents.each {|utensil| utensil.eat}
drawer.contents.each {|utensil| assert_clean utensil, false}
fork.clean_silverware
assert_clean fork, true

assert_remove drawer, fork
assert_dump drawer
assert_open_closed drawer, true
assert_open_closed drawer, false



# 5. Reflection 
# I'm a little confused about the directions here. The reason I'm getting the last error message (when fork is defined the second time in the driver code) is because it's asking to remove an item that is not in the drawer. Hence, fork is set to nil insted of a Silverware object.
# My work-around is to just create a new silverware object called "hands". 
# Testing some of the object functionality was also kind of tedious. But, I guess it gave me some good practice writing tests for different methods.


